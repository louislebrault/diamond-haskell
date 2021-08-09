{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Run (run) where

import Prelude (putStrLn)
import Import
import Util

{-
   Importing Prelude is probably wrong ? I followed those examples:
   https://www.fpcomplete.com/haskell/library/rio/
-}

run :: RIO App ()
run = do
  state <- ask
  let input = appInput state
  liftIO $ putStrLn $ "Here is the diamond:\n" ++ toDiamond input
