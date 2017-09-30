module Main where
 import Prelude
 import System.Environment(getArgs)

 main :: IO ()
 main = do
  args <- getArgs
  case args of
   origin : input : output : options -> ddgen origin input output options
   _ -> printUsage
 
 ddgen :: String -> String -> String -> [String] -> IO ()
 ddgen = undefined

 printUsage :: IO ()
 printUsage = undefined
