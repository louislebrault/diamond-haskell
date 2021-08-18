{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module UtilSpec (spec) where

import Import
import Util
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "plus2" $ do
    it "basic check" $ plus2 0 `shouldBe` 2
    it "overflow" $ plus2 maxBound `shouldBe` minBound + 1
    prop "minus 2" $ \i -> plus2 i - 2 `shouldBe` i

  describe "toDiamond" $ do
    it "draw a diamond, put input in the middle" $ toDiamond 'C' `shouldBe`
      "  A\n B B\nC   C\n B B\n  A"

  describe "toDiamond2" $ do
    it "draw a diamond, put input in the middle" $ toDiamond2 'C' `shouldReturn`
      "  A\n B B\nC   C\n B B\n  A"

  describe "addSpaces" $ do
    it "add spaces to a string"
      $ addSpaces "Hello" 3 `shouldBe`
      "Hello   "
