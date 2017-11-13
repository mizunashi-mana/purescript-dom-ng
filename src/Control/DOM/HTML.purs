module Control.DOM.HTML where

import Prelude

import Control.Monad.Eff (Eff)
import Data.DOM.Effect   (DOM)
import Data.DOM.HTML     as HTML
import Data.Newtype      (wrap)
import DOM.HTML          as Orig

window :: forall eff. Eff (dom :: DOM | eff) HTML.Window
window = wrap <$> Orig.window
