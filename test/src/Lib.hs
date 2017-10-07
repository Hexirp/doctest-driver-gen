module Lib
    ( someFunc
    ) where

-- | Print some message.
--
-- >>> someFunc
-- someFunc
someFunc :: IO ()
someFunc = putStrLn "someFunc"
