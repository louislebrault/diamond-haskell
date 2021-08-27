{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Run (run) where

import Prelude (putStrLn, head)
import Import
import Util

run :: RIO App ()
run = do
  state <- ask
  let input = appInput state
  liftIO $ putStrLn $ "Here is the diamond:\n" ++ toDiamond (head input)
