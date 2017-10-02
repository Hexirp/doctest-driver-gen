-- |
-- Module      : Test.DocTest.Gen
-- Copyright   : (c) 2017 Hexirp
--
-- License     : BSD 3-clause "New" or "Revised" License
-- Maintainer  : https://github.com/Hexirp/doctest-driver-gen/issues
-- Stability   : experimental
-- Portability : portable
--
-- Provide doctest-driver-gen's functions.
module Test.DocTest.Gen where
 import Prelude
 import Data.List (unlines)

 -- | Run doctest-driver-gen.
 --
 -- Usage:
 --
 -- > doctest-driver-gen srcname input output [OPTION]...
 --
 -- Or, make your driver file with the content:
 --
 -- > {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}
 --
 -- @OPTION@ is doctest's option. You can see help with @doctest --help@.
 ddgen :: [String] -> IO ()
 ddgen (src : inp : out : opts) = ddgen_output src inp out opts
 ddgen _                        = ddgen_usage

 -- | Output driver file.
 ddgen_output
  :: String -- ^ A source file name
  -> String -- ^ A file path to input
  -> String -- ^ A file path to output
  -> [String] -- ^ Options for doctest
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
  "  doctest-driver-gen srcname input output [OPTION]...",
  "",
  "Or, make your driver file with the content:",
  "  {-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}",
  "",
  "OPTION is doctest's option. You can see help with \"doctest --help\"."]
