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

addLine :: String -> Int -> Int -> IO String
addLine acc inputIndex count = do
  liftIO $ print inputIndex
  if count < inputIndex
  then addLine (acc ++ "\n" ++ addSpaces acc count ++ [L.genericIndex alphab count]) inputIndex (count + 1)
  else return acc

toDiamond2 :: Char -> IO String
toDiamond2 input = do addLine "" ((fromMaybe 0 $ L.elemIndex input alphab) + 1) 0

