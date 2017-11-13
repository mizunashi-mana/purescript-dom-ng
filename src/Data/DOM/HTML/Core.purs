module Data.DOM.HTML.Core where

import DOM.HTML.Types as Orig
import Data.DOM.Event as Event
import Data.DOM.Node as Node
import Data.Foreign.Coerce (class ForeignCoercible)
import Data.Foreign.Read (class ReadForeign, class HasForeignTag)
import Data.Foreign.Read as Foreign
import Data.Newtype (class Newtype)

newtype Navigator = Navigator Orig.Navigator
derive instance newtypeNavigator :: Newtype Navigator _

newtype Location = Location Orig.Location
derive instance newtypeLocation :: Newtype Location _

newtype Window = Window Orig.Window
derive instance newtypeWindow :: Newtype Window _

newtype History = History Orig.History
derive instance newtypeHistory :: Newtype History _

newtype Document = Document Orig.HTMLDocument
derive instance newtypeDocument :: Newtype Document _

newtype HTMLElement = HTMLElement Orig.HTMLElement
derive instance newtypeHTMLElement :: Newtype HTMLElement _


-- HasForeignTag instances

instance foreignTagForDocument :: HasForeignTag Document where
  foreignTag _ = "HTMLDocument"


-- ReadForeign instances

instance readDocument :: ReadForeign Document where
  readForeign = Foreign.greadForeign


-- ForeignCoerce instances

-- | Window -> Event.EventTarget
instance windowToEventTarget :: ForeignCoercible Window Event.EventTarget

-- | Document -> Node.Document
instance htmlDocumentToDocument :: ForeignCoercible Document Node.Document

-- | Document -> Node.Document -> Node.NonElementParentNode
instance htmlDocumentToNonElementParentNode :: ForeignCoercible Document Node.NonElementParentNode
