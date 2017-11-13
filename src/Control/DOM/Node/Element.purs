module Control.DOM.Node.Element
  ( className
  , setClassName
  , classList
  ) where

import Prelude

import Control.Monad.Eff (Eff)
import Data.DOM.Effect (DOM)
import Data.DOM.Node as Node
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import Data.Newtype (wrap, op)
import DOM.Node.Types as Orig

className :: forall e eff. ForeignCoercible e Node.Element => e -> Eff (dom :: DOM | eff) String
className = foreignLeftCoerce $ _className <<< op Node.Element

foreign import _className :: forall eff. Orig.Element -> Eff (dom :: DOM | eff) String

setClassName :: forall e eff. ForeignCoercible e Node.Element => String -> e -> Eff (dom :: DOM | eff) Unit
setClassName clsName = foreignLeftCoerce $ _setClassName clsName <<< op Node.Element

foreign import _setClassName :: forall eff. String -> Orig.Element -> Eff (dom :: DOM | eff) Unit

classList :: forall e eff. ForeignCoercible e Node.Element => e -> Eff (dom :: DOM | eff) Node.DOMTokenList
classList = foreignLeftCoerce $ map wrap <<< _classList <<< op Node.Element

foreign import _classList :: forall eff. Orig.Element -> Eff (dom :: DOM | eff) Orig.DOMTokenList
