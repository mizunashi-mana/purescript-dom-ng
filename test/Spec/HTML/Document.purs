module Test.Spec.HTML.Document where

import Prelude

import Control.Monad.Eff.Class   (liftEff)
import Test.Unit                 (TestSuite, describe, it)
import Test.Unit.Assert          (shouldEqual)
import Data.DOM.Effect           (DOM)
import Data.DOM.HTML             as HTML
import Control.DOM.HTML.Document (readyStateByContext)

testsHtmlDocument :: forall eff. TestSuite (dom :: DOM | eff)
testsHtmlDocument = do
  describe "readyState" do
    it "should return a sensible readyState" do
      rs <- liftEff readyStateByContext
      rs `shouldEqual` HTML.Complete
