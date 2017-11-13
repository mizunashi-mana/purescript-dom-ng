module Test.Spec.HTMLDocument where

import Prelude
import Control.Monad.Eff.Class (liftEff)
import Test.Unit               (TestSuite, describe, it)
import Test.Unit.Assert        (shouldEqual)
import Data.DOM.HTML           as HTML
import Control.DOM.HTML        (readyStateD)

testsHtmlDocument :: forall eff. TestSuite (dom :: HTML.DOM | eff)
testsHtmlDocument = do
  describe "readyState" do
    it "should return a sensible readyState" do
      rs <- liftEff readyStateD
      rs `shouldEqual` HTML.Complete
