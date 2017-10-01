module Main where
 import Prelude
 import Data.List (unlines, words)
 import System.Environment (getArgs)

 main :: IO ()
 main = do
  args <- getArgs
  case args of
   source : input : output : options -> ddgen source input output options
   _ -> printUsage
 
 ddgen :: String -> String -> String -> [String] -> IO ()
 ddgen _ _ out opts = writeFile out $ ddgenFile opts

 ddgenFile :: [String] -> String
 ddgenFile opts = unlines [
  "import Test.DocTest",
  "",
  "main :: IO ()",
  "main = doctest " ++ show (opts >>= words)]

 printUsage :: IO ()
 printUsage = undefined
