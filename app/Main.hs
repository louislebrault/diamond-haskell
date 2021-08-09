{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
module Main (main) where

import Import
import Run
import RIO.Process
import Options.Applicative.Simple
import qualified Paths_diamond_haskell

input :: Parser String
input = strOption
  (  long "input"
  <> metavar "TARGET"
  <> help "Target for the greeting" )

main :: IO ()
main = do
  (input, ()) <- simpleOptions
    $(simpleVersion Paths_diamond_haskell.version)
    "Header for command line arguments"
    "Program description, also for command line arguments"
    input
    empty
  lo <- logOptionsHandle stderr True
  pc <- mkDefaultProcessContext
  withLogFunc lo $ \lf ->
    let app = App
          { appLogFunc = lf
          , appProcessContext = pc
          , appInput = input
          }
     in runRIO app run
