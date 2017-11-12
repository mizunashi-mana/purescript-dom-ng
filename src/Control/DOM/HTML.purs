module Control.DOM.HTML where

import Prelude
import Control.Monad.Eff (Eff)
import Data.DOM.HTML     as HTML
import DOM.HTML          (window)   as Orig
import DOM.HTML.Window   (document) as Orig
import DOM.HTML.Document (body, readyState) as Orig
import Data.Newtype      (wrap, unwrap)
import Data.Maybe        (Maybe)

window :: forall eff. Eff (dom :: HTML.DOM | eff) HTML.Window
window = wrap <$> Orig.window

document :: forall eff. HTML.Window -> Eff (dom :: HTML.DOM | eff) HTML.HTMLDocument
document = map wrap <<< Orig.document <<< unwrap

body :: forall eff. HTML.HTMLDocument -> Eff (dom :: HTML.DOM | eff) (Maybe HTML.HTMLElement)
body = map (map wrap) <<< Orig.body <<< unwrap

readyState :: forall eff. HTML.HTMLDocument -> Eff (dom :: HTML.DOM | eff) HTML.ReadyState
readyState = Orig.readyState <<< unwrap
