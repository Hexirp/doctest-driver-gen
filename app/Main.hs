module Main where
 import Prelude
 import System.Environment (getArgs)

 import Test.DocTest.Gen

 main :: IO ()
 main = getArgs >>= ddgen
