module Data.DOM.Event.Core where

import Prelude
import DOM.Event.Types      as Orig
import Data.Newtype         (class Newtype, wrap)
import Unsafe.ForeignCoerce (class ReadForeign, class ForeignCoercible, class HasForeignTag)
import Unsafe.ForeignCoerce as FC

newtype Event = Event Orig.Event
derive instance newtypeEvent :: Newtype Event _

newtype EventTarget = EventTarget Orig.EventTarget
derive instance newtypeEventTarget :: Newtype EventTarget _

newtype CustomEvent = CustomEvent Orig.CustomEvent
derive instance newtypeCustomEvent :: Newtype CustomEvent _

newtype UIEvent = UIEvent Orig.UIEvent
derive instance newtypeUIEvent :: Newtype UIEvent _

newtype FocusEvent = FocusEvent Orig.FocusEvent
derive instance newtypeFocusEvent :: Newtype FocusEvent _


-- HasForeignTag instances

instance foreignTagForCustomEvent :: HasForeignTag CustomEvent where
  foreignTag _ = "CustomEvent"


-- ReadForeign instances

instance readEventTarget :: ReadForeign EventTarget where
  readForeign = map wrap <<< Orig.readEventTarget

instance readCustomEvent :: ReadForeign CustomEvent where
  readForeign = FC.greadForeign


-- ForeignCoerce instances

instance customEventToEvent :: ForeignCoercible CustomEvent Event where
  foreignCoerce = FC.gforeignCoerce
