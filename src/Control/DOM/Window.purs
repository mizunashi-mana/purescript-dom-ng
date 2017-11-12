module Control.DOM.Window where

import Prelude
import Control.Monad.Eff (Eff)
import DOM               (DOM)
import Data.DOM.HTML     (Window, HTMLDocument)
import DOM.HTML.Window   as Orig
import Data.Newtype      (wrap, unwrap)

document :: forall eff. Window -> Eff (dom :: DOM | eff) HTMLDocument
document = map wrap <<< Orig.document <<< unwrap
