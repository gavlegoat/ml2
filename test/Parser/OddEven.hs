{-# LANGUAGE OverloadedStrings #-}

module Parser.OddEven
  ( shouldParse
  , expected
  ) where

import AST

shouldParse :: Bool
shouldParse = True

expected :: [Declaration ()]
expected = [ oddEven, stmt1, stmt2 ]

oddEven :: Declaration ()
oddEven = DLetRec ()
  [ BFunc () "odd" [x] (Just (TType () "bool")) oddBody
  , BFunc () "even" [x] Nothing evenBody
  ]

x :: Parameter ()
x = Parameter () "x" (Just (TType () "int"))

oddBody :: Expr ()
oddBody =
  EIf ()
    (EBinop ()
      (EVar () "x")
      (OEq ())
      (EConst () (CInt () 0)))
    (EConst () (CBool () False))
    (EApp ()
      (EVar () "even")
      (EBinop () (EVar () "x") (OMinus ()) (EConst () (CInt () 1))))

evenBody :: Expr ()
evenBody =
  EIf ()
    (EBinop ()
      (EVar () "x")
      (OEq ())
      (EConst () (CInt () 0)))
    (EConst () (CBool () True))
    (EApp ()
      (EVar () "odd")
      (EBinop () (EVar () "x") (OMinus ()) (EConst () (CInt () 1))))

stmt1 :: Declaration ()
stmt1 =
  DLet () [ BPattern ()
                     (PWildcard ())
                     (EApp () (EVar () "odd") (EConst () (CInt () 5)))]

stmt2 :: Declaration ()
stmt2 =
  DLet () [ BPattern ()
                     (PWildcard ())
                     (EApp () (EVar () "even") (EConst () (CInt () 5)))]
