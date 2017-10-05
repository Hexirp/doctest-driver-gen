-- |
-- Module      : Test.DocTest.Gen
--
-- Stability   : experimental
-- Portability : portable
--
-- Provide doctest-driver-gen's functions.
module Test.DocTest.Gen where
 import Prelude
 import Data.List (unlines)

 -- * Usage

 -- $usage
 --
 -- > {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}
 --
 -- Make your driver file with the content.
 -- @OPTION@ is doctest's option. You can see help with @doctest --help@.

 -- * Documentation

 -- | Run doctest-driver-gen with given list of arguments.
 ddgen :: [String] -> IO ()
 ddgen (src : inp : out : opts) = ddgen_output src inp out opts
 ddgen _                        = ddgen_usage

 -- | Output driver file.
 ddgen_output
  :: String -- ^ Name of the original source file.
  -> String -- ^ Name of the file holding the input.
  -> String -- ^ Name of the file where this should write its output to.
  -> [String] -- ^ Options for doctest.
  -> IO ()
 ddgen_output _ _ out opts = writeFile out $ unlines [
  "import Test.DocTest",
  "",
  "main :: IO ()",
  "main = doctest " ++ show opts]

 -- | Print doctest-driver-gen's usage.
 ddgen_usage :: IO ()
 ddgen_usage = putStrLn $ unlines [
  "Usage:",
  "  {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}",
  "",
  "Make your driver file with the content.",
  "\"OPTION\" is doctest's option. You can see help with \"doctest --help\"."]
