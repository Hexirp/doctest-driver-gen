-- | Provide doctest-driver-gen's functions.
module Test.DocTest.Gen where
 import Prelude
 import Data.List (unlines)

 -- | Run doctest-driver-gen.
 ddgen :: [String] -> IO ()
 ddgen (src : inp : out : opts) = ddgen_output src inp out opts
 ddgen _ = putStrLn ddgen_usage

 -- | Output the generated source code to a file.
 ddgen_output :: String -> String -> String -> [String] -> IO ()
 ddgen_output _ _ out opts = writeFile out $ ddgen_file opts

 -- | Generate a source code.
 ddgen_file :: [String] -> String
 ddgen_file opts = unlines [
  "import Test.DocTest",
  "",
  "main :: IO ()",
  "main = doctest " ++ show opts]

 -- | doctest-driver-gen's usage.
 ddgen_usage :: String
 ddgen_usage = unlines [
  "usage:",
  "  doctest-driver-gen srcname input output [OPTION]...",
  "",
  "Or, make your driver file with the content:",
  "  {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}",
  "",
  "OPTION is doctest's option.]
