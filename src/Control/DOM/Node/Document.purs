module Control.DOM.Node.Document where

import Prelude
import Control.Monad.Eff (Eff)
import DOM.Node.Document as Orig
import Data.DOM.Node as Node
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import Data.Maybe (Maybe)
import Data.Newtype (wrap, op)
import Data.DOM.Effect (DOM)

documentElement :: forall d eff. ForeignCoercible d Node.Document
  => d -> Eff (dom :: DOM | eff) (Maybe Node.Element)
documentElement = foreignLeftCoerce
  $ map (map wrap) <<< Orig.documentElement <<< op Node.Document
