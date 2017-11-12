module Data.DOM.HTML.Core where

import DOM.HTML.Types       as Orig
import Data.Newtype         (class Newtype)
import Unsafe.ForeignCoerce (class ReadForeign, class ForeignCoercible, class HasForeignTag)
import Unsafe.ForeignCoerce as FC
import Data.DOM.Event       as Event
import Data.DOM.Node        as Node

newtype Navigator = Navigator Orig.Navigator
derive instance newtypeNavigator :: Newtype Navigator _

newtype Location = Location Orig.Location
derive instance newtypeLocation :: Newtype Location _

newtype Window = Window Orig.Window
derive instance newtypeWindow :: Newtype Window _

newtype History = History Orig.History
derive instance newtypeHistory :: Newtype History _

newtype HTMLDocument = HTMLDocument Orig.HTMLDocument
derive instance newtypeHTMLDocument :: Newtype HTMLDocument _


-- HasForeignTag instances

instance foreignTagForHTMLDocument :: HasForeignTag HTMLDocument where
  foreignTag _ = "HTMLDocument"


-- ReadForeign instances

instance readHTMLDocument :: ReadForeign HTMLDocument where
  readForeign = FC.greadForeign


-- ForeignCoerce instances

instance windowToEventTarget :: ForeignCoercible Window Event.EventTarget where
  foreignCoerce = FC.gforeignCoerce

instance htmlDocumentToDocument :: ForeignCoercible HTMLDocument Node.Document where
  foreignCoerce = FC.gforeignCoerce
