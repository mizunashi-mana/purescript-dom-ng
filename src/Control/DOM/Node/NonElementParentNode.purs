module Control.DOM.Node.NonElementParentNode where

import Prelude

import Control.Monad.Eff   (Eff)
import Data.DOM.Effect     (DOM)
import Data.DOM.Node       as Node
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import Data.Maybe          (Maybe)
import Data.Newtype        (wrap, op)
import DOM.Node.NonElementParentNode as Orig

getElementById :: forall n eff. ForeignCoercible n Node.NonElementParentNode
  => Node.ElementId -> n -> Eff (dom :: DOM | eff) (Maybe Node.Element)
getElementById eid = foreignLeftCoerce
  $ map (map wrap) <<< Orig.getElementById eid <<< op Node.NonElementParentNode
