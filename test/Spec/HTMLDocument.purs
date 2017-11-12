module Test.Spec.HTMLDocument where

import Prelude
import Control.Monad.Eff.Class (liftEff)
import Test.Unit               (TestSuite, describe, it)
import Test.Unit.Assert        (shouldEqual)
import Data.DOM.HTML           (DOM, ReadyState(..))
import Control.DOM.HTML        (document, window, readyState)

testsHtmlDocument :: forall eff. TestSuite (dom :: DOM | eff)
testsHtmlDocument = do
  describe "readyState" do
    it "should return a sensible readyState" do
      rs <- liftEff $ readyState =<< document =<< window
      rs `shouldEqual` Complete
