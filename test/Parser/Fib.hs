{-# LANGUAGE OverloadedStrings #-}

module Parser.Fib
  ( shouldParse
  , expected
  ) where

import AST

shouldParse :: Bool
shouldParse = True

expected :: [Declaration ()]
expected = [ fib1, fib2, stmt1, stmt2 ]

fib1 :: Declaration ()
fib1 = DLetRec () [ BFunc () "fib1" [x1] (Just tint) fib1body ]

x1 :: Parameter ()
x1 = Parameter () "x" (Just tint)

tint :: Type ()
tint = TType () "int"

fib1body :: Expr ()
fib1body =
  EIf ()
    (EBinop ()
      (EVar () "x")
      (OLt ())
      (EConst () (CInt () 2)))
    (EVar () "x")
    (EBinop ()
      (EApp ()
        (EVar () "fib1")
        (EBinop () (EVar () "x") (OMinus ()) (EConst () (CInt () 1))))
      (OPlus ())
      (EApp ()
        (EVar () "fib1")
        (EBinop () (EVar () "x") (OMinus ()) (EConst () (CInt () 2)))))

fib2 :: Declaration ()
fib2 = DLet () [BFunc () "fib2" [Parameter () "x" Nothing] Nothing fib2body]

fib2body :: Expr ()
fib2body =
  ELetRec () [
    BFunc () "helper"
      [ Parameter () "n" Nothing
      , Parameter () "a" Nothing
      , Parameter () "b" Nothing
      ]
      (Just tint)
      (EIf ()
        (EBinop ()
          (EVar () "n")
          (OEq ())
          (EConst () (CInt () 0)))
        (EVar () "a")
        (EApp ()
          (EApp ()
            (EApp ()
              (EVar () "helper")
              (EBinop ()
                (EVar () "n")
                (OMinus ())
                (EConst () (CInt () 1))))
            (EVar () "b"))
          (EBinop ()
            (EVar () "a")
            (OPlus ())
            (EVar () "b"))))
  ]
  (EApp ()
    (EApp ()
      (EApp ()
        (EVar () "helper")
        (EVar () "x"))
      (EConst () (CInt () 0)))
    (EConst () (CInt () 1)))

stmt1 :: Declaration ()
stmt1 =
  DLet () [ BPattern ()
                     (PWildcard ())
                     (EApp () (EVar () "fib1") (EConst () (CInt () 5))) ]

stmt2 :: Declaration ()
stmt2 =
  DLet () [ BPattern ()
                     (PWildcard ())
                     (EApp () (EVar () "fib2") (EConst () (CInt () 5))) ]
