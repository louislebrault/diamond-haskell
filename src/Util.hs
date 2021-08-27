{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}
-- | Silly utility module, used to demonstrate how to write a test
-- case.
module Util
  ( plus2
    , toDiamond
    , addSpaces
  ) where

import RIO
import qualified RIO.Char as C
import qualified RIO.List as L
import Prelude (print)

plus2 :: Int -> Int
plus2 = (+ 2)

addSpaces :: String -> Int -> String
addSpaces acc count = if (count <= 0)
                       then acc
                       else addSpaces (acc ++ " ") (count - 1)

spaces :: Int -> String
spaces count = addSpaces "" count

alphab :: [Char]
alphab = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

addLine :: Int -> String -> Int -> String
addLine count acc inputIndex
  | count == 0 =
    addLine (count + 1) (addSpaces acc (inputIndex - count + 1) ++ [L.genericIndex alphab count]) inputIndex
  | count <= inputIndex =
    addLine (count + 1) (addSpaces (acc ++ "\n") (inputIndex - count) ++ [L.genericIndex alphab count] ++ spaces (count * 2 + 1) ++ [L.genericIndex alphab count]) inputIndex
  | count < (inputIndex * 2) =
    addLine (count + 1) (addSpaces (acc ++ "\n") (count - inputIndex) ++ [L.genericIndex alphab (inputIndex - (count - inputIndex))] ++ spaces ((inputIndex - (count - inputIndex)) * 2 + 1) ++ [L.genericIndex alphab (inputIndex - (count - inputIndex))]) inputIndex
  | count == (inputIndex * 2) =
    addLine (count + 1) (addSpaces (acc ++ "\n") (count - inputIndex + 1) ++ [L.genericIndex alphab (inputIndex - (count - inputIndex))]) inputIndex
  | otherwise =
    acc

toDiamond :: Char -> String
toDiamond input = addLine 0 "" (fromMaybe 0 $ L.elemIndex input alphab)
