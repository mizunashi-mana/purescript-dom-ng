module Test.SpecUtil where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Error.Class (throwError, class MonadThrow)
import Data.Maybe (Maybe (..))
import Control.Monad.Eff.Exception (error)

exceptJust :: forall e m a. MonadThrow e m => e -> Maybe a -> m a
exceptJust err = case _ of
  Just x  -> pure x
  Nothing -> throwError err

assertJust :: forall e a. String -> Maybe a -> Aff e a
assertJust msg = exceptJust $ error msg
