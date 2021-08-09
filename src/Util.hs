{-# LANGUAGE NoImplicitPrelude #-}
-- | Silly utility module, used to demonstrate how to write a test
-- case.
module Util
  ( plus2
    , toDiamond
  ) where

import RIO

plus2 :: Int -> Int
plus2 = (+ 2)

toDiamond :: String -> String
toDiamond input = "  A\n B B\nC   C\n B B\n  A"
