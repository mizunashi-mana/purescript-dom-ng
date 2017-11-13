module Test.Spec.HTML.Window where

import Prelude

import Control.Monad.Eff.Class (liftEff)
import Control.DOM.HTML        (window)
import Control.DOM.CSS.Window  (innerWidth, innerHeight, screenX, screenY)
import Data.DOM.Effect         (DOM)
import Data.DOM.HTML           as HTML
import Test.Unit               (TestSuite, describe, it)
import Test.Unit.Assert        (shouldEqual)

testsHtmlWindow :: forall eff. TestSuite (dom :: DOM, window :: HTML.WINDOW | eff)
testsHtmlWindow = do
  describe "innerHeight" do
    it "should return the default inner height" do
      windowHeight <- liftEff $ innerHeight =<< window
      windowHeight `shouldEqual` 300

  describe "innerWidth" do
    it "should return the default inner width" do
      windowWidth <- liftEff $ innerWidth =<< window
      windowWidth `shouldEqual` 400

  describe "screenX" do
    it "should get the X coordinate of the window" do
      windowScreenX <- liftEff $ screenX =<< window
      windowScreenX `shouldEqual` 0

  describe "screenY" do
    it "should get the Y coordinate of the window" do
      windowScreenY <- liftEff $ screenY =<< window
      windowScreenY `shouldEqual` 0

