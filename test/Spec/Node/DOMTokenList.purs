module Test.Spec.Node.DOMTokenList where

import Prelude

import Control.DOM.Node.Element      (className, setClassName, classList)
import Control.DOM.Node.DOMTokenList as TokenList
import Control.Monad.Eff.Class       (liftEff)
import Data.DOM.Effect               (DOM)
import Data.Maybe                    (Maybe(..))
import Test.SpecUtil                 as Util
import Test.Unit                     (TestSuite, describe, it)
import Test.Unit.Assert              (shouldEqual)


testsDOMTokenList :: forall eff. TestSuite (dom :: DOM | eff)
testsDOMTokenList = do
  describe "DOMTokenList of classList" do
    it "contains a token" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        TokenList.contains list "a"
      result `shouldEqual` true

    it "adds a token" do
      body <- Util.assertBody
      result <- liftEff do
        -- clear class names, first
        setClassName "" body
        list <- classList body
        TokenList.add list "a"
        className body
      result `shouldEqual` "a"

    it "removes a token" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        TokenList.remove list "b"
        resultA <- TokenList.contains list "a"
        resultB <- TokenList.contains list "b"
        resultC <- TokenList.contains list "c"
        -- Only "b" should be removed
        pure $ resultA && not resultB && resultC
      result `shouldEqual` true

    it "toggles a token by removing its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        _ <- TokenList.toggle list "c"
        className body
      result `shouldEqual` "a b"

    it "toggles a token by adding its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b" body
        list <- classList body
        _ <- TokenList.toggle list "c"
        className body
      result `shouldEqual` "a b c"

    it "toggles a token by forcing to add its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b" body
        list <- classList body
        _ <- TokenList.toggleFull list "c" (Just true)
        className body
      result `shouldEqual` "a b c"

    it "toggles a token by forcing to add (but not to remove) its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        _ <- TokenList.toggleFull list "c" (Just true)
        className body
      result `shouldEqual` "a b c"

    it "toggles a token by forcing to remove its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        _ <- TokenList.toggleFull list "c" (Just false)
        className body
      result `shouldEqual` "a b"

    it "toggles a token by forcing to remove (but not to add) its value" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b" body
        list <- classList body
        _ <- TokenList.toggleFull list "c" (Just false)
        className body
      result `shouldEqual` "a b"

    it "returns an item if available" do
      body <- Util.assertBody
      item <- liftEff do
        setClassName "a b c" body
        list <- classList body
        TokenList.item list 2
      result <- Util.assertJust "not found" item
      result `shouldEqual` "c"

    it "returns not an item if it's not available" do
      body <- Util.assertBody
      result <- liftEff do
        setClassName "a b c" body
        list <- classList body
        TokenList.item list 5
      Util.assertNothing "an item is available" result
