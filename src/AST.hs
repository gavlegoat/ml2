{-# LANGUAGE DeriveFunctor #-}

{-|
Module      : AST
Description : Syntax trees for ML2
Copyright   : (c) Greg Anderson, 2022
License     : BSD3
Maintainer  : ganderso@cs.utexas.edu
Stability   : experimental

This module contains the data definitions of syntax trees for ML2.
-}

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

-- | Constants
data Constant a
  = CInt a Integer       -- ^ Integer constants
  | CFloat a Double      -- ^ Floating point constants
  | CString a ByteString -- ^ String constants
  | CBool a Bool         -- ^ Boolean constants
  deriving (Show, Eq, Functor)

-- | Types
data Type a
  = TType a ByteString         -- ^ Base types (e.g., int)
  | TVar a ByteString          -- ^ Type variables (e.g., 'a)
  | TFunc a (Type a) (Type a)  -- ^ Function types (e.g., 'a -> 'b)
  | TApp a (Type a) ByteString -- ^ Type applications (e.g., 'a list)
  | TTuple a [Type a]          -- ^ Tuple types (e.g., 'a * 'b * 'c)
  deriving (Show, Eq, Functor)

-- | Binary operators
data Binop a
  = OPlus a   -- ^ Addition
  | OMinus a  -- ^ Subtraction
  | OTimes a  -- ^ Multiplication
  | ODivide a -- ^ Division
  | OLt a     -- ^ Less than
  | OLe a     -- ^ Less or equal
  | OEq a     -- ^ Equal
  | ONeq a    -- ^ Not equal
  | OGe a     -- ^ Greater or equal
  | OGt a     -- ^ Greater than
  | OAnd a    -- ^ Boolean and
  | OOr a     -- ^ Boolean or
  | OSeq a    -- ^ Expression sequencing
  deriving (Show, Eq, Functor)

-- | Unary operators
data Unop a
  = UNot a    -- ^ Boolean negation
  | UNegate a -- ^ Arithmetic negation
  deriving (Show, Eq, Functor)

-- | Constructors
data Constructor a = Constructor a ByteString deriving (Show, Eq, Functor)

-- | Patterns for pattern matching
data Pattern a
  = PVar a ByteString                          -- ^ Pattern variable
  | PWildcard a                                -- ^ Wildcard pattern (_)
  | PConst a (Constant a)                      -- ^ Constant pattern
  | PAs a (Pattern a) ByteString               -- ^ "as" binding
  | POr a (Pattern a) (Pattern a)              -- ^ Choice patterns
  | PConstructor a (Constructor a) [Pattern a] -- ^ Constructor patterns
  | PTuple a [Pattern a]                       -- ^ Tuple pattern
  | PList a [Pattern a]                        -- ^ Literal list pattern
  | PCons a (Pattern a) (Pattern a)            -- ^ List cons pattern
  deriving (Show, Eq, Functor)

-- | Pattern matching rule, including a pattern, an optional guard, and a
-- resulting expression
data PatternMatch a
  = PatternMatch a (Pattern a) (Maybe (Expr a)) (Expr a)
  deriving (Show, Eq, Functor)

-- | Function parameters with optional types
data Parameter a
  = Parameter a ByteString (Maybe (Type a))
  deriving (Show, Eq, Functor)

-- | Function binding
data Binding a
  -- | Functions defind on patterns (e.g., f ([x]) = e)
  = BPattern a (Pattern a) (Expr a)
  -- | Functions defined on named parameters (e.g., f x = e)
  | BFunc a ByteString [Parameter a] (Maybe (Type a)) (Expr a)
  deriving (Show, Eq, Functor)

-- | Expressions
data Expr a
  = EVar a ByteString                                 -- ^ Variable
  | EConst a (Constant a)                             -- ^ Constant
  | EType a (Expr a) (Type a)                         -- ^ Typed expression
  | ETuple a [Expr a]                                 -- ^ Tuple expression
  | EConstructor a (Constructor a)                    -- ^ Constructor
  | EList a [Expr a]                                  -- ^ Explicit list
  | ECons a (Expr a) (Expr a)                         -- ^ List cons
  | EApp a (Expr a) (Expr a)                          -- ^ Function application
  | EBinop a (Expr a) (Binop a) (Expr a)              -- ^ Binary operator
  | EUnop a (Unop a) (Expr a)                         -- ^ Unary operator
  | EIf a (Expr a) (Expr a) (Expr a)                  -- ^ Conditional
  | EMatch a (Expr a) [PatternMatch a]                -- ^ Match/with
  | ELambda a [Parameter a] (Maybe (Type a)) (Expr a) -- ^ Anonymous function
  | ELet a [Binding a] (Expr a)                       -- ^ Let binding
  | ELetRec a [Binding a] (Expr a)                    -- ^ Recursive binding
  deriving (Show, Eq, Functor)

-- | Top-level declarations
data Declaration a
  = DLet a [Binding a]    -- ^ Non-recursive definition
  | DLetRec a [Binding a] -- ^ Recursive definition
  deriving (Show, Eq, Functor)
