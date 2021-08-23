{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}
-- | Silly utility module, used to demonstrate how to write a test
-- case.
module Util
  ( plus2
    , toDiamond
    , addSpaces
    , toDiamond2
  ) where

import RIO
import qualified RIO.Char as C
import qualified RIO.List as L
import Prelude (print)

plus2 :: Int -> Int
plus2 = (+ 2)

toDiamond :: Char -> String
toDiamond input =
  let index = C.ord input in
  "  A\n B B\n" ++ [input] ++ "   " ++ [input] ++ "\n B B\n  A"

addSpaces :: String -> Int -> String
addSpaces acc count = if (count <= 0)
                       then acc
                       else addSpaces (acc ++ " ") (count - 1)

alphab :: [Char]
alphab = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

addLine :: Int -> String -> Int -> String
addLine count acc inputIndex
  | trace (fromString $ show count ++ " " ++ acc) False = ""
  | count == 0 = addLine (count + 1) (addSpaces acc (inputIndex - count) ++ [L.genericIndex alphab count]) inputIndex
  | count > 0 && count < inputIndex = addLine (count + 1) (addSpaces (acc ++ "\n") (inputIndex - count) ++ [L.genericIndex alphab count]) inputIndex
  | otherwise = acc

toDiamond2 :: Char -> String
toDiamond2 input = addLine 0 "" ((fromMaybe 0 $ L.elemIndex input alphab) + 1)
