module Control.DOM.HTML.Document where

import Prelude

import Control.Monad.Eff (Eff)
import Data.Foreign.Coerce (class ForeignCoercible, foreignCoerce)
import Data.DOM.Effect (DOM)
import Data.DOM.HTML as HTML
import Data.Maybe (Maybe)
import Data.Newtype (wrap, op)
import DOM.HTML.Document as Orig
import Control.DOM.HTML (window)
import Control.DOM.HTML.Window (document)

body :: forall d eff. ForeignCoercible d HTML.Document => d -> Eff (dom :: DOM | eff) (Maybe HTML.HTMLElement)
body = map (map wrap) <<< Orig.body <<< op HTML.Document <<< foreignCoerce

bodyByContext :: forall eff. Eff (dom :: DOM | eff) (Maybe HTML.HTMLElement)
bodyByContext = body =<< document =<< window

readyState :: forall d eff. ForeignCoercible d HTML.Document => d -> Eff (dom :: DOM | eff) HTML.ReadyState
readyState = Orig.readyState <<< op HTML.Document <<< foreignCoerce

readyStateByContext :: forall eff. Eff (dom :: DOM | eff) HTML.ReadyState
readyStateByContext = readyState =<< document =<< window
