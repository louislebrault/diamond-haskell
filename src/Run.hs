{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Run (run) where

import Prelude (putStrLn)
import Import

{-
   Importing Prelude is probably wrong ? I followed those examples:
   https://www.fpcomplete.com/haskell/library/rio/
-}

run :: RIO App ()
run = do
  state <- ask
  let input = appInput state
  liftIO $ putStrLn $ "We're inside the application! Input is " ++ input
