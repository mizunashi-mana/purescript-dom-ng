module Control.DOM.Node.Element.Extension
  ( innerHTML
  , outerHTML
  ) where

import Prelude
import Control.Monad.Eff (Eff)
import Data.DOM.Node as Node
import Data.Newtype (op)
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import DOM.Node.Types as Orig
import Data.DOM.Effect (DOM)


-- https://w3c.github.io/DOM-Parsing/#extensions-to-the-element-interface


innerHTML :: forall e eff. ForeignCoercible e Node.Element => e -> Eff (dom :: DOM | eff) String
innerHTML = foreignLeftCoerce $ _innerHTML <<< op Node.Element

foreign import _innerHTML :: forall eff. Orig.Element -> Eff (dom :: DOM | eff) String

outerHTML :: forall e eff. ForeignCoercible e Node.Element => e -> Eff (dom :: DOM | eff) String
outerHTML = foreignLeftCoerce $ _outerHTML <<< op Node.Element

foreign import _outerHTML :: forall eff. Orig.Element -> Eff (dom :: DOM | eff) String
