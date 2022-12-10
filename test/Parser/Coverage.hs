{-# LANGUAGE OverloadedStrings #-}

module Parser.Coverage
  ( shouldParse
  , expected
  ) where

import AST

shouldParse :: Bool
shouldParse = True

expected :: [Declaration ()]
expected = [tmap, func, destruct]

tmap :: Declaration ()
tmap = DLet ()
  [ BFunc () "tmap"
      [ Parameter () "f" (Just $ TFunc () (TVar () "a") (TType () "int"))
      , Parameter () "x" (Just $ TTuple () [ TVar () "a"
                                           , TApp () (TVar () "b") "list"
                                           ])
      ]
      (Just $ TTuple () [ TType () "int"
                        ,  TApp () (TVar () "b") "list"
                        ])
      (EMatch () (EVar () "x")
        [cnst, tuple, as, guard, wild, por, list, constr])
  ]

cnst :: PatternMatch ()
cnst = PatternMatch () (PConst () (CInt () 3)) Nothing $
  EType () (EVar () "z") (TType () "int")

tuple :: PatternMatch ()
tuple = PatternMatch () (PTuple () [PVar () "y", PVar () "z"]) Nothing $
  ETuple () [EApp () (EVar () "f") (EVar () "y"), EVar () "z"]

as :: PatternMatch ()
as = PatternMatch () (PAs () (PCons () (PVar () "y")
                                       (PVar () "z")) "lst") Nothing $
  EIf ()
    (EConst () (CBool () True))
    (EBinop ()
      (EUnop () (UNegate ()) (EConst () (CInt () 1)))
      (OGe ())
      (EConst () (CInt () 2)))
    (EBinop ()
      (EConst () (CInt () 3))
      (OEq ())
      (EConst () (CInt () 4)))

guard :: PatternMatch ()
guard = PatternMatch () (PVar () "x")
  (Just $ EBinop () (EVar () "x") (OLt ()) (EConst () (CInt () 0))) $
  EBinop ()
    (EBinop ()
      (EConst () (CInt () 1))
      (OPlus ())
      (EBinop ()
        (EConst () (CInt () 2))
        (OTimes ())
        (EConst () (CInt () 3))))
    (OGt ())
    (EConst () (CInt () 4))

wild :: PatternMatch ()
wild = PatternMatch () (PWildcard ()) Nothing $
  EConst () (CBool () False)

por :: PatternMatch ()
por = PatternMatch () (POr () (PCons () (PVar () "y") (PVar () "z"))
                             (PTuple () [PVar () "a", PVar () "b"])) Nothing $
  EBinop ()
    (EBinop ()
      (EConst () (CFloat () 10.4))
      (OMinus ())
      (EBinop ()
        (EConst () (CFloat () 5.4))
        (ODivide ())
        (EConst () (CFloat () 0.3))))
    (OLe ())
    (EConst () (CInt () 3))

list :: PatternMatch ()
list = PatternMatch () (PList () [PVar () "head", PVar () "tail"]) Nothing $
  EConst () (CString () "string")

constr :: PatternMatch ()
constr = PatternMatch () (PConstructor () (Constructor () "Constr")
                                          [PVar () "a", PVar () "b"]) Nothing $
  EBinop ()
    (EBinop ()
      (EBinop ()
        (EVar () "a")
        (OAnd ())
        (EVar () "b"))
      (OOr ())
      (EBinop ()
        (EConst () (CInt () 1))
        (OLt ())
        (EConst () (CInt () 2))))
    (OOr ())
    (EUnop ()
      (UNot ())
      (EBinop ()
        (EVar () "a")
        (ONeq ())
        (EVar () "b")))

func :: Declaration ()
func = DLetRec ()
  [ BPattern () (PVar () "func") $
      ELambda () [Parameter () "a" Nothing] Nothing
        (ELet () [BPattern () (PVar () "b") (EBinop ()
                                              (EVar () "a")
                                              (OPlus ())
                                              (EConst () (CInt () 1)))]
          (ELetRec () [BFunc () "c" [Parameter () "x" Nothing] Nothing
                      (EConst () (CInt () 0))]
            (EApp () (EVar () "c") (EVar () "b"))))
  ]

destruct :: Declaration ()
destruct = DLet ()
  [ BPattern ()
      (PTuple () [PVar () "a", PVar () "b"])
      (EApp ()
        (EApp ()
          (EConstructor () (Constructor () "Constr"))
          (EVar () "x"))
        (ECons ()
          (EVar () "y")
          (EList ()
            [ EVar () "y1"
            , EVar () "y2"
            , EVar () "y3"
            ])))
  ]
