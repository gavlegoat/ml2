{

module Parser
  ( parseMain
  ) where

import Data.ByteString.Lazy.Char8 (ByteString)

import qualified Lexer as Lex
import AST

type Info = ()

}

%expect 0

%name parseMain start
%tokentype { Lex.Token }
%error { parseError }
%monad { Lex.Alex } { >>= } { pure }
%lexer { lexer } { Lex.EOF }

%left ';'
%right '::'
%left '||'
%left '&&'
%nonassoc '<' '<=' '=' '<>' '>=' '>'
%left '+' '-'
%right '->'
%left '*' '/'

%nonassoc as
%left '|'

%token
  -- Keywords
  let   { Lex.Let }
  in    { Lex.In }
  and   { Lex.LetAnd }
  rec   { Lex.Rec }
  as    { Lex.As }
  if    { Lex.If }
  then  { Lex.Then }
  else  { Lex.Else }
  match { Lex.Match }
  with  { Lex.With }
  when  { Lex.When }
  fun   { Lex.Fun }
  -- Parens
  '(' { Lex.LParen }
  ')' { Lex.RParen }
  '[' { Lex.LBracket }
  ']' { Lex.RBracket }
  -- Operators
  --  Arithmetic
  '+' { Lex.Plus }
  '-' { Lex.Minus }
  '*' { Lex.Times }
  '/' { Lex.Divide }
  --   Comparison
  '<'  { Lex.Lt }
  '<=' { Lex.Le }
  '='  { Lex.Eq }
  '<>' { Lex.Neq }
  '>=' { Lex.Ge }
  '>'  { Lex.Gt }
  --   Logical
  '&&' { Lex.And }
  '||' { Lex.Or }
  '!'  { Lex.Not }
  -- Data-carrying tokens
  id     { Lex.Identifier _ }
  constr { Lex.Constructor _ }
  int    { Lex.Integer _ }
  float  { Lex.Float _ }
  string { Lex.String _ }
  true   { Lex.TTrue }
  false  { Lex.FFalse }
  -- Other tokens
  ':'  { Lex.Colon }
  '::' { Lex.DoubleColon }
  ';'  { Lex.Semicolon }
  ';;' { Lex.DoubleSemi }
  ','  { Lex.Comma }
  '->' { Lex.Arrow }
  '_'  { Lex.Underscore }
  apo  { Lex.Apostrophe }
  '|'  { Lex.Pipe }

%%

start :: { [Declaration Info] }
  : start1 { reverse $1 }

start1 :: { [Declaration Info] }
  : decl %shift      { [$1] }
  | decl ';;'        { [$1] }
  | start1 ';;' decl { $3 : $1 }

decl :: { Declaration Info }
  : let bindings     { DLet () (reverse $2) }
  | let rec bindings { DLetRec () (reverse $3) }

bindings :: { [Binding Info] }
  : binding              { [$1] }
  | bindings and binding { $3 : $1 }

binding :: { Binding Info }
  : pattern '=' expr                { BPattern () $1 $3 }
  | id parameters ':' type '=' expr { BIdType () (getId $1) $2 $4 $6 }

parameters :: { [Parameter Info] }
  : parameter            { [$1] }
  | parameters parameter { $2 : $1 }

pattern :: { Pattern Info }
  : id                     { PVar () (getId $1) }
  | '_'                    { PWildcard () }
  | constant               { PConst () $1 }
  | pattern '|' pattern    { POr () $1 $3 }
  | pattern as id          { PAs () $1 (getId $3) }
  | '(' pattern ')'        { $2 }
  | constr patterns_nosep  { PConstructor () (getConstr $1 ()) $2 }
  | '(' patterns_comma ')' { PTuple () (reverse $1) }
  | '[' patterns_semi ']'  { PList () (reverse $2) }
  | pattern '::' pattern   { PCons () $1 $3 }

patterns_nosep :: { [Pattern Info] }
  : {- empty -}            { [] }
  | patterns_nosep pattern { $2 : $1 }

patterns_comma :: { [Pattern Info] }
  : {- empty -}                { [] }
  | patterns_comma ',' pattern { $3 : $1 }

patterns_semi :: { [Pattern Info] }
  : {- empty -}                { [] }
  | patterns_comma ';' pattern { $3 : $1 }

-- NOTE: Expression parsing is heavily influenced by GHC. See
-- github.com/ghc/ghc/compiler/GHC/Parser.y
expr :: { Expr Info }
  : infix_expr ':' type { EType () $1 $3 }
  | infix_expr %shift   { $1 }

infix_expr :: { Expr Info }
  : infix_expr bop expr1       { EBinop () $1 $2 $3 }
  | infix_expr '::' infix_expr { ECons () $1 $3 }
  | expr1                      { $1 }

expr1 :: { Expr Info }
  : '-' fexpr %shift { EUnop () (UNegate ()) $2 }
  | '!' fexpr %shift { EUnop () (UNot ())  $2 }
  | fexpr %shift     { $1 }

fexpr :: { Expr Info }
  : fexpr aexpr { EApp () $1 $2 }
  | aexpr       { $1 }

aexpr :: { Expr Info }
  : fun parameters '->' expr          { ELambda () (reverse $2) Nothing $4 }
  | fun parameters ':' type '->' expr { ELambda () (reverse $2) (Just $4) $6 }
  | let bindings in expr              { ELet () $2 $4 }
  | let rec bindings in expr          { ELetRec () (reverse $3) $5 }
  | if expr then expr else expr       { EIf () $2 $4 $6 }
  | match expr with pattern_matching  { EMatch () $2 $4 }
  | aexpr1                            { $1 }

aexpr1 :: { Expr Info }
  : id                  { EVar () (getId $1) }
  | constr              { EConstructor () (getConstr $1) }
  | constant            { EConst () $1 }
  | '(' expr ')'        { $2 }
  | '(' exprs_comma ')' { ETuple () (reverse $1) }
  | '[' exprs_semi ']'  { EList () (reverse $2) }

exprs_comma :: { [Expr Info] }
  : {- empty -}          { [] }
  | exprs_comma ',' expr { $3 : $1 }

exprs_semi :: { [Expr Info] }
  : {- empty -}          { [] }
  | exprs_comma ';' expr { $3 : $1 }

bop :: { Binop Info }
  : '+'  { OPlus () }
  | '-'  { OMinus () }
  | '*'  { OTimes () }
  | '/'  { ODivide () }
  | '<'  { OLt () }
  | '<=' { OLe () }
  | '='  { OEq () }
  | '<>' { ONeq () }
  | '>=' { OGe () }
  | '>'  { OGt () }
  | '&&' { OAnd () }
  | '||' { OOr () }
  | ';'  { OSeq () }

pattern_matching :: { [PatternMatch Info] }
  : matches     { reverse $1 }
  | '|' matches { reverse $2 }

matches :: { [PatternMatch Info] }
  : pattern_match             { [$1] }
  | matches '|' pattern_match { $3 : $1 }

pattern_match :: { PatternMatch Info }
  : pattern '->' expr           { PatternMatch () $1 Nothing $3 }
  | pattern when expr '->' expr { PatternMatch () $1 (Just $3) $5 }

type :: { Type Info }
  : type '->' type1 { TFunc () $1 $3 }
  | type1 id        { TApp () $1 (getId $2) }
  | type_tuple      { TTuple () (reverse $1) }
  | type1 %shift    { $1 }

type_tuple :: { [Type Info] }
  : type                { [$1] }
  | type_tuple '*' type { $3 : $1 }

type1 :: { Type Info }
  : id           { TType () (getId $1) }
  | apo id       { TVar () (getId $2) }
  | '(' type ')' { $2 }

parameter :: { Paramter Info }
  : id                  { Parameter () (getId $1) Nothing }
  | '(' id ':' type ')' { Parameter () (getId $2) (Just $4) }

constant :: { Constant Info }
  : int           { CInt () (getInt $1) }
  | float         { CFloat () (getFloat $1) }
  | string        { CString () (getString $1) }
  | true          { CTrue () }
  | false         { CFalse () }

{

parseError :: Lex.Token -> Lex.Alex a
parseError _ = do
  (Lex.AlexPn _ line col, _, _, _) <- Lex.alexGetInput
  Lex.alexError $ "Parse error at " <> show line <> ":" <> show col

lexer :: (Lex.Token -> Lex.Alex a) -> Lex.Alex a
lexer = (=<< Lex.alexMonadScan)

getId :: Lex.Token -> ByteString
getId (Lex.Identifier id) = id
getId _ = error "Impossible error: Tried to extract an id from a non-id token"

getConstr :: Lex.Token -> a -> Constructor a
getConstr (Lex.Constructor id) info = Constructor info id
getConstr _ _ = error "Impossible error: Tried to extract a constructor from a non-constructor token"

getInt :: Lex.Token -> Integer
getInt (Lex.Integer i) = i
getInt _ = error "Impossible error: Tried to extract an int from a non-int token"

getFloat :: Lex.Token -> Double
getFloat (Lex.Float d) = d
getFloat _ = error "Impossible error: Tried to extract a float from a non-float token"

getString :: Lex.Token -> ByteString
getString (Lex.String bs) = bs
getString _ = error "Impossible error: Tried to extract a string from a non-string token"

}
