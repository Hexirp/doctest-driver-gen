module Test.DocTest.Gen where
 import Prelude
 import Data.List (unlines)

 ddgen :: [String] -> IO ()
 ddgen (src : inp : out : opts) = ddgen_output src inp out opts
 ddgen _                        = ddgen_usage

 ddgen_output :: String -> String -> String -> [String] -> IO ()
 ddgen_output _ _ out opts = writeFile out $ unlines [
  "import Test.DocTest",
  "",
  "main :: IO ()",
  "main = doctest " ++ show opts]

 ddgen_usage :: IO ()
 ddgen_usage = putStrLn $ unlines [
  "usage:",
  "  {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}"]
