{
module Lexer
  ( Alex
  , AlexPosn (..)
  , Token (..)
  , alexGetInput
  , alexError
  , alexMonadScan
  , runAlex
  ) where

import Data.ByteString.Lazy.Char8 as BS
import Control.Monad (when)
}
%wrapper "monadUserState-bytestring"

@id = [a-z_] ([0-9a-zA-Z_])*
@constr = [A-Z] ([0-9a-zA-Z_])*

@dec = [0-9]+
@hex = '0x'[0-9a-fA-F]+
@oct = '0o'[0-7]+ @bin = '0b'[0-1]+ @integer = [\+\-]? (@dec | @hex | @oct | @bin)
@integer = @dec | @hex | @oct

@exp      = [eE] [\+\-]? @dec
@floating = [\+\-]? (@dec \. @dec @exp? | @dec @exp)

tokens :-

<0> $white+ ;

-- Comments
<0>       "(*" { increaseCommentDepth `andBegin` comment }
<0>       "*)" { \_ _ -> alexError "Error: end comment token outside comment" }
<comment> "(*" { increaseCommentDepth }
<comment> "*)" { decreaseCommentDepth }
<comment> \n   ;
<comment> .    ;

-- Strings
<0>      \"   { startString `andBegin` string }
<string> \"   { endString `andBegin` 0 }
<string> \\\\ { stringEscapeChar '\\' }
<string> \\\" { stringEscapeChar '"' }
<string> \\n  { stringEscapeChar '\n' }
<string> \\t  { stringEscapeChar '\t' }
<string> .    { stringNormalChar }

-- Other data-carrying tokens
<0> @integer  { tokInt }
<0> @floating { tokFloat }
<0> "true"    { tok TTrue }
<0> "false"   { tok FFalse }

-- Keywords
<0> let   { tok Let }
<0> in    { tok In }
<0> and   { tok LetAnd }
<0> rec   { tok Rec }
<0> as    { tok As }
<0> if    { tok If }
<0> then  { tok Then }
<0> else  { tok Else }
<0> match { tok Match }
<0> with  { tok With }
<0> when  { tok When }
<0> fun   { tok Fun }

-- Parens
<0> "(" { tok LParen }
<0> ")" { tok RParen }
<0> "[" { tok LBracket }
<0> "]" { tok RBracket }

-- Operators
--   Arithmetic
<0> "+" { tok Plus }
<0> "-" { tok Minus }
<0> "*" { tok Times }
<0> "/" { tok Divide }
--   Comparison
<0> "<"  { tok Lt }
<0> "<=" { tok Le }
<0> "="  { tok Eq }
<0> "<>" { tok Neq }
<0> ">=" { tok Ge }
<0> ">"  { tok Gt }
--   Logical
<0> "&&" { tok And }
<0> "||" { tok Or }
<0> "!"  { tok Not }

-- Other tokens
<0> "::" { tok DoubleColon }
<0> ":"  { tok Colon }
<0> ";"  { tok Semicolon }
<0> ";;" { tok DoubleSemi }
<0> ","  { tok Comma }
<0> "->" { tok Arrow }
<0> "_"  { tok Underscore }
<0> "'"  { tok Apostrophe }
<0> "|"  { tok Pipe }

<0> @id     { tokId }
<0> @constr { tokConstr }

{

data Token
  -- Keywords
  = Let
  | In
  | LetAnd
  | Rec
  | As
  | If
  | Then
  | Else
  | Match
  | With
  | When
  | Fun
  -- Parens
  | LParen
  | RParen
  | LBracket
  | RBracket
  -- Operators
  --   Arithmetic
  | Plus
  | Minus
  | Times
  | Divide
  --   Comparison
  | Lt
  | Le
  | Eq
  | Neq
  | Ge
  | Gt
  --   Logical
  | And
  | Or
  | Not
  -- Data-carrying tokens
  | Identifier ByteString
  | Constructor ByteString
  | Integer Integer
  | Float Double
  | String ByteString
  | TTrue
  | FFalse
  -- Other tokens
  | Colon
  | Semicolon
  | DoubleColon
  | DoubleSemi
  | Comma
  | Arrow
  | Underscore
  | Apostrophe
  | Pipe
  | EOF
  deriving(Eq, Show)

data AlexUserState = AlexUserState
  { commentDepth :: Int
  , stringBuffer :: ByteString
  }

alexInitUserState :: AlexUserState
alexInitUserState = AlexUserState
  { commentDepth = 0
  , stringBuffer = BS.empty
  }

-- The get and set functions are only defined by alex for the String version
-- of the monad wrapper, so they are reproduced here
alexGetUserState :: Alex AlexUserState
alexGetUserState = Alex $ \s@AlexState{alex_ust=ust} -> Right (s, ust)

alexSetUserState :: AlexUserState -> Alex ()
alexSetUserState ust = Alex $ \s -> Right (s{alex_ust=ust}, ())

increaseCommentDepth :: AlexAction Token
increaseCommentDepth i l = do
  ust <- alexGetUserState
  alexSetUserState ust { commentDepth = (commentDepth ust) + 1 }
  skip i l

decreaseCommentDepth :: AlexAction Token
decreaseCommentDepth i l = do
  ust <- alexGetUserState
  let depth = commentDepth ust - 1
  alexSetUserState ust { commentDepth = depth }
  when (depth == 0) $ alexSetStartCode 0
  skip i l

startString :: AlexAction Token
startString i l = do
  ust <- alexGetUserState
  alexSetUserState ust { stringBuffer = BS.empty }
  skip i l

endString :: AlexAction Token
endString _ _ = do
  ust <- alexGetUserState
  pure $ String $ BS.reverse (stringBuffer ust)

stringEscapeChar :: Char -> AlexAction Token
stringEscapeChar c i l = do
  ust <- alexGetUserState
  let str = stringBuffer ust
  alexSetUserState ust { stringBuffer = BS.cons' c str }
  skip i l

stringNormalChar :: AlexAction Token
stringNormalChar i@(_, _, s, _) l = do
  ust <- alexGetUserState
  let str = stringBuffer ust
  let c = BS.index s (l - 1)
  alexSetUserState ust { stringBuffer = BS.cons' c str }
  skip i l

alexEOF :: Alex Token
alexEOF = do
  code <- alexGetStartCode
  when (code == comment) $ alexError "Error: unclosed comment at end of file"
  when (code == string) $ alexError "Error: EOF while scanning string"
  pure EOF

tok :: Token -> AlexAction Token
tok t _ _ = pure t

tokId :: AlexAction Token
tokId (_, _, s, _) l = pure $ Identifier $ BS.take l s

tokConstr :: AlexAction Token
tokConstr (_, _, s, _) l = pure $ Constructor $ BS.take l s

tokInt :: AlexAction Token
tokInt (_, _, s, _) l = pure $ Integer $ read $ BS.unpack $ BS.take l s

tokFloat :: AlexAction Token
tokFloat (_, _, s, _) l = pure $ Float $ read $ BS.unpack $ BS.take l s

}
