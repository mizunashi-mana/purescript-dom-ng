module Test.SpecUtil where

import Prelude

import Control.DOM.HTML.Document (bodyByContext)
import Control.Monad.Eff.Exception (error)
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Error.Class (throwError, class MonadThrow)
import Data.DOM.Effect (DOM)
import Data.DOM.HTML as HTML
import Data.Maybe (Maybe (..))

exceptJust :: forall e m a. MonadThrow e m => e -> Maybe a -> m a
exceptJust err = case _ of
  Just x  -> pure x
  Nothing -> throwError err

assertJust :: forall e a. String -> Maybe a -> Aff e a
assertJust msg = exceptJust $ error msg

exceptNothing :: forall e m a. MonadThrow e m => e -> Maybe a -> m Unit
exceptNothing err = case _ of
  Just _  -> throwError err
  Nothing -> pure unit

assertNothing :: forall e a. String -> Maybe a -> Aff e Unit
assertNothing msg = exceptNothing $ error msg

assertBody :: forall eff. Aff (dom :: DOM | eff) HTML.HTMLElement
assertBody = do
  mbody <- liftEff bodyByContext
  assertJust "no body" mbody
