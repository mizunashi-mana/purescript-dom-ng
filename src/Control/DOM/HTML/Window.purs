module Control.DOM.HTML.Window where

import Prelude
import Control.Monad.Eff (Eff)
import Data.DOM.Effect (DOM)
import Data.DOM.HTML as HTML
import Data.Foreign.Coerce (class ForeignCoercible, foreignCoerce)
import Data.Newtype (wrap, op)
import DOM.HTML.Window as Orig
import Control.DOM.HTML (window)

document :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) HTML.Document
document = map wrap <<< Orig.document <<< op HTML.Window <<< foreignCoerce

documentByContext :: forall eff. Eff (dom :: DOM | eff) HTML.Document
documentByContext = document =<< window
