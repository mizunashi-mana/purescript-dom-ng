module Control.DOM.Node.DOMTokenList where

import Prelude

import Control.Monad.Eff     (Eff)
import Data.DOM.Node         as Node
import Data.DOM.Effect       (DOM)
import Data.Foreign.Coerce   (class ForeignCoercible, foreignLeftCoerce)
import Data.Newtype          (op)
import Data.Maybe            (Maybe(..))
import DOM.Node.ClassList    as Orig

add :: forall l eff. ForeignCoercible l Node.DOMTokenList => l -> String -> Eff (dom :: DOM | eff) Unit
add = foreignLeftCoerce $ Orig.add <<< op Node.DOMTokenList

remove :: forall l eff. ForeignCoercible l Node.DOMTokenList => l -> String -> Eff (dom :: DOM | eff) Unit
remove = foreignLeftCoerce $ Orig.remove <<< op Node.DOMTokenList

contains :: forall l eff. ForeignCoercible l Node.DOMTokenList => l -> String -> Eff (dom :: DOM | eff) Boolean
contains = foreignLeftCoerce $ Orig.contains <<< op Node.DOMTokenList

toggle :: forall l eff. ForeignCoercible l Node.DOMTokenList => l -> String -> Eff (dom :: DOM | eff) Boolean
toggle list token = toggleFull list token Nothing

toggleFull :: forall l eff. ForeignCoercible l Node.DOMTokenList
  => l -> String -> Maybe Boolean -> Eff (dom :: DOM | eff) Boolean
toggleFull = foreignLeftCoerce $ \list token -> case _ of
  Just isForce -> Orig.toggleForce (op Node.DOMTokenList list) token isForce
  Nothing      -> Orig.toggle (op Node.DOMTokenList list) token

item :: forall l eff. ForeignCoercible l Node.DOMTokenList => l -> Int -> Eff (dom :: DOM | eff) (Maybe String)
item = foreignLeftCoerce $ Orig.item <<< op Node.DOMTokenList
