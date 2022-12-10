{

module Parser
  ( parseMain
  , Info(..)
  ) where

import Data.ByteString.Lazy.Char8 (ByteString)
import Data.List (intercalate)

import qualified Lexer as Lex
import AST

}

%expect 0

%name parseMain start
%tokentype { Lex.Token }
%error { parseError }
%errorhandlertype explist
%monad { Lex.Alex } { >>= } { pure }
%lexer { lexer } { Lex.EOF }

%left ';'
%left '|'
%right '::'
%nonassoc as
%left PAPP
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

------------------------------------------------------------------------------
-- NOTE: Throughout the grammar, lists are parsed in reverse order to yield --
-- a more efficient, left-recursive parser                                  --
------------------------------------------------------------------------------

---------------------------------------------------
-- Top-Level: Programs are lists of declarations --
---------------------------------------------------

start :: { [Declaration Info] }
  : start1 optdoublesemi { reverse $1 }

start1 :: { [Declaration Info] }
  : decl                      { [$1] }
  | start1 optdoublesemi decl { $3 : $1 }

optdoublesemi :: { () }
  : {- empty -} { () }
  | ';;'        { () }

------------------
-- Declarations --
------------------

-- Each declaration is a (possibly recursive) let binding
decl :: { Declaration Info }
  : let bindings     { DLet () (reverse $2) }
  | let rec bindings { DLetRec () (reverse $3) }

-- Let bindings may use the "and" keyword to allow mutual reference
bindings :: { [Binding Info] }
  : binding              { [$1] }
  | bindings and binding { $3 : $1 }

-- A binding may either be a pattern destructuring or a function declaration
binding :: { Binding Info }
  : pattern '=' expr                { BPattern () $1 $3 }
  | id parameters '=' expr          { BFunc () (getId $1) (reverse $2) Nothing $4 }
  | id parameters ':' type '=' expr { BFunc () (getId $1) (reverse $2) (Just $4) $6 }

-- Function parameters
parameters :: { [Parameter Info] }
  : parameter            { [$1] }
  | parameters parameter { $2 : $1 }

-- Each parameter is an optionally typed identifier
parameter :: { Parameter Info }
  : id                  { Parameter () (getId $1) Nothing }
  | '(' id ':' type ')' { Parameter () (getId $2) (Just $4) }

--------------
-- Patterns --
--------------

-- %shift in the constructor rule allows the constructor to apply to as many
-- following patterns as possible.
pattern :: { Pattern Info }
  : id                           { PVar () (getId $1) }
  | '_'                          { PWildcard () }
  | constant                     { PConst () $1 }
  | pattern '|' pattern          { POr () $1 $3 }
  | pattern as id                { PAs () $1 (getId $3) }
  | '(' pattern ')'              { $2 }
  | constr patterns_nosep %shift { PConstructor () (getConstr $1 ()) $2 }
  | '(' patterns_comma ')'       { PTuple () (reverse $2) }
  | '[' patterns_semi ']'        { PList () (reverse $2) }
  | pattern '::' pattern         { PCons () $1 $3 }

-- %prec PAPP causes the pattern list construction to bind tighter than 'as',
-- '|', or '::'
patterns_nosep :: { [Pattern Info] }
  : {- empty -}                       { [] }
  | patterns_nosep pattern %prec PAPP { $2 : $1 }

patterns_comma :: { [Pattern Info] }
  : {- empty -}                { [] }
  | patterns_comma ',' pattern { $3 : $1 }

patterns_semi :: { [Pattern Info] }
  : {- empty -}                { [] }
  | patterns_comma ';' pattern { $3 : $1 }

-----------------
-- Expressions --
-----------------

-- NOTE: Expression parsing is heavily influenced by GHC. See
-- github.com/ghc/ghc/compiler/GHC/Parser.y
-- Splitting up the expression rules this way resolves a lot of ambiguity in
-- the grammar

-- Top-level expressions may optionally be typed
-- Both expr rules %shift so that expressions extend as far to the right
-- as possible
expr :: { Expr Info }
  : infix_expr ':' type %shift { EType () $1 $3 }
  | infix_expr %shift          { $1 }

-- An expression with optional, left-associative infix operators
-- '::' is handled separately so that it can be right associative
infix_expr :: { Expr Info }
  : infix_expr bop expr1       { EBinop () $1 $2 $3 }
  | infix_expr '::' infix_expr { ECons () $1 $3 }
  | expr1                      { $1 }

-- Expressions with optional unary operators
expr1 :: { Expr Info }
  : '-' fexpr %shift { EUnop () (UNegate ()) $2 }
  | '!' fexpr %shift { EUnop () (UNot ())  $2 }
  | fexpr     %shift { $1 }

-- Expressions with optional function application
fexpr :: { Expr Info }
  : fexpr '(' expr ')'  { EApp () $1 $3 }
  | fexpr base_expr     { EApp () $1 $2 }
  | aexpr               { $1 }

-- Expressions with bindings and destructuring
aexpr :: { Expr Info }
  : fun parameters '->' expr                { ELambda () (reverse $2) Nothing $4 }
  | fun parameters ':' type_tuple '->' expr { ELambda () (reverse $2) (Just $ mkTupleType $4) $6 }
  | let bindings in expr                    { ELet () $2 $4 }
  | let rec bindings in expr                { ELetRec () (reverse $3) $5 }
  | if expr then expr else expr             { EIf () $2 $4 $6 }
  | match expr with pattern_matching        { EMatch () $2 $4 }
  | aexpr1                                  { $1 }

-- Lowest-level expressions
aexpr1 :: { Expr Info }
  : base_expr           { $1 }
  | '(' expr ')'        { $2 }
  | '(' exprs_comma ')' { ETuple () (reverse $2) }
  | '[' exprs_semi ']'  { EList () (reverse $2) }

base_expr :: { Expr Info }
  : id       { EVar () (getId $1) }
  | constr   { EConstructor () (getConstr $1 ()) }
  | constant { EConst () $1 }

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

constant :: { Constant Info }
  : int    { CInt () (getInt $1) }
  | float  { CFloat () (getFloat $1) }
  | string { CString () (getString $1) }
  | true   { CBool () True }
  | false  { CBool () False }

----------------------
-- Pattern matching --
----------------------

-- Both pattern_matching rules shift so that all patterns are considered part
-- of the set of match clauses.
pattern_matching :: { [PatternMatch Info] }
  : matches %shift     { reverse $1 }
  | '|' matches %shift { reverse $2 }

matches :: { [PatternMatch Info] }
  : pattern_match             { [$1] }
  | matches '|' pattern_match { $3 : $1 }

pattern_match :: { PatternMatch Info }
  : pattern '->' expr           { PatternMatch () $1 Nothing $3 }
  | pattern when expr '->' expr { PatternMatch () $1 (Just $3) $5 }

-----------
-- Types --
-----------

-- The %shift is here because type tuples should include as much as possible
-- Note that a single type is actually parsed as a tuple of length 1, then we
-- reinterpret it as a single type if possible.
type :: { Type Info }
  : type '->' type    { TFunc () $1 $3 }
  | type_tuple %shift { mkTupleType $1 }

type_tuple :: { [Type Info] }
  : type_app                { [$1] }
  | type_tuple '*' type_app { $3 : $1 }

type_app :: { Type Info }
  : type1 id     { TApp () $1 (getId $2) }
  | type1 %shift { $1 }

type1 :: { Type Info }
  : id           { TType () (getId $1) }
  | apo id       { TVar () (getId $2) }
  | '(' type ')' { $2 }

{

-- A type of information to pass along with each parse derivation. Empty for
-- now but may be useful in the future for error reporting.
type Info = ()

parseError :: (Lex.Token, [String]) -> Lex.Alex a
parseError (_, exp) = do
  (Lex.AlexPn _ line col, _, _, _) <- Lex.alexGetInput
  Lex.alexError $ "Parse error at " <> show line <> ":" <> show col <> ". Expected tokens: " <> intercalate ", " exp

lexer :: (Lex.Token -> Lex.Alex a) -> Lex.Alex a
lexer = (Lex.alexMonadScan >>=)

mkTupleType :: [Type Info] -> Type Info
mkTupleType [x] = x
mkTupleType lst = TTuple () (reverse lst)

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
