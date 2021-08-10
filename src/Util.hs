{-# LANGUAGE NoImplicitPrelude #-}
-- | Silly utility module, used to demonstrate how to write a test
-- case.
module Util
  ( plus2
    , toDiamond
  ) where

import RIO
import qualified RIO.Char as C

plus2 :: Int -> Int
plus2 = (+ 2)

{-
  trouvé l'index de la lettre entrante dans l'alphabet
  bouclé sur l'alphabet en ajoutant les lettres :
  nombre d'espace dbt ligne = index de input dans l'alphabet - index de la lettre courante
-}



toDiamond :: Char -> String
toDiamond input =
  let index = C.ord input in
  "  A\n B B\n" ++ [input] ++ "   " ++ [input] ++ "\n B B\n  A"
