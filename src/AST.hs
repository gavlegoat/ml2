module AST
  ( Constant (..)
  , Type (..)
  , Binop (..)
  , Unop (..)
  , Constructor (..)
  , Pattern (..)
  , PatternMatch (..)
  , Parameter (..)
  , Binding (..)
  , Expr (..)
  , Declaration (..)
  ) where

import Data.ByteString.Lazy.Char8 (ByteString)

data Constant a
  = CInt a Integer
  | CFloat a Double
  | CString a ByteString
  | CTrue a
  | CFalse a
  | CNil a
  | CUnit a
  | CConstructor a (Constructor a)

data Type a
  = TType a ByteString
  | TVar a ByteString
  | TFunc a (Type a) (Type a)
  | TApp a (Type a) ByteString
  | TTuple a [Type a]

data Binop a
  = OPlus a
  | OMinus a
  | OTimes a
  | ODivide a
  | OLt a
  | OLe a
  | OEq a
  | ONeq a
  | OGe a
  | OGt a
  | OAnd a
  | OOr a
  | OSeq a

data Unop a
  = UNot a
  | UNegate a

data Constructor a = Constructor a ByteString

data Pattern a
  = PVar a ByteString
  | PWildcard a
  | PConst a (Constant a)
  | PAs a (Pattern a) ByteString
  | PType a (Pattern a) (Type a)
  | POr a (Pattern a) (Pattern a)
  | PConstructor a (Constructor a) [Pattern a]
  | PTuple a [Pattern a]
  | PList a [Pattern a]
  | PCons a (Pattern a) (Pattern a)

-- PatternMatch pattern guard? result_expr
data PatternMatch a
  = PatternMatch a (Pattern a) (Maybe (Expr a)) (Expr a)

data Parameter a = Parameter a ByteString (Maybe (Type a))

data Binding a
  = BPattern a (Pattern a) (Expr a)
  | BIdType a ByteString [Parameter a] (Type a) (Expr a)

data Expr a
  = EVar a ByteString
  | EConst a (Constant a)
  | EType a (Expr a) (Type a)
  | ETuple a [Expr a]
  | EConstructor a (Constructor a)
  | EList a [Expr a]
  | ECons a (Expr a) (Expr a)
  | EApp a (Expr a) (Expr a)
  | EBinop a (Expr a) (Binop a) (Expr a)
  | EUnop a (Unop a) (Expr a)
  | EIf a (Expr a) (Expr a) (Expr a)
  | EMatch a (Expr a) [PatternMatch a]
  | ELambda a [Parameter a] (Maybe (Type a)) (Expr a)
  | ELet a [Binding a] (Expr a)
  | ELetRec a [Binding a] (Expr a)
  | ESeq a (Expr a) (Expr a)

data Declaration a
  = DLet a [Binding a]
  | DLetRec a [Binding a]
