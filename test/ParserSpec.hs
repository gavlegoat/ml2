{-|
Module      : ParserSpec
Description : Tests for the parser
Copyright   : (c) Greg Anderson, 2022
License     : BSD3
Maintainer  : ganderso@cs.utexas.edu
Stability   : experimental

This module collects and runs a number of tests for the ML2 parser. Each test
is defined in two files in the test/Parser folder. The first is an ML2 input
file with a `.ml2` extension. The second is a Haskell module containing two
values: `shouldParse` is a boolean indicating whether the ML2 file should parse
without error, and `expected` is the expected parse tree. Note that the tests
in this file do not check whether the tracking info from the parser is correct,
only that the structure is right.
-}

module ParserSpec
  ( spec
  ) where

import Test.Hspec
import Control.Monad (void)
import qualified Data.ByteString.Lazy.Char8 as BS

import Lexer (runAlex)
import Parser (Info, parseMain)
import AST

import qualified Parser.Fib as Fib
import qualified Parser.OddEven as OddEven
import qualified Parser.Coverage as Coverage

-- | Parser test cases, as described above.
testCases :: [(String, Bool, [Declaration Info])]
testCases =
  [ ("test/Parser/fib.ml2", Fib.shouldParse, Fib.expected)
  , ("test/Parser/odd_even.ml2", OddEven.shouldParse, OddEven.expected)
  , ("test/Parser/coverage.ml2", Coverage.shouldParse, Coverage.expected)
  ]

-- | Remove all extraneous informatoin from the parse tree.
stripInfo :: [Declaration a] -> [Declaration ()]
stripInfo = map void

-- | Convert a test case description to an actual HSpec test case.
buildTestCase :: (String, Bool, [Declaration Info]) -> IO ()
buildTestCase (fn, shouldParse, expected) = do
  code <- BS.readFile fn
  hspec $ describe ("parser [" <> fn <> "]") $
    case runAlex code parseMain of
      Left _ ->
        it "fails only when it should" $ False `shouldBe` shouldParse
      Right ast -> do
        it "parses when it should" $ shouldParse `shouldBe` True
        it "parses correctly" $ stripInfo ast `shouldBe` stripInfo expected

-- | The main parser specification.
spec :: Spec
spec = runIO $ mapM_ buildTestCase testCases
