module Main where
 import Prelude
 import Data.List (unlines, words)
 import System.Environment (getArgs)

 import Test.DocTest.Gen

 main :: IO ()
 main = getArgs >>= ddgen
