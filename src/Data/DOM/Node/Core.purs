module Data.DOM.Node.Core where

import DOM.Node.Types       as Orig
import Data.Newtype         (class Newtype)
import Data.Foreign.Coerce  (class ForeignCoercible)
import Data.Foreign.Read    (class ReadForeign, class HasForeignTag)
import Data.Foreign.Read    as Foreign

newtype Node = Node Orig.Node
derive instance newtypeNode :: Newtype Node _

newtype NonElementParentNode = NonElementParentNode Orig.NonElementParentNode
derive instance newtypeNonElementParentNode :: Newtype NonElementParentNode _

newtype ParentNode = ParentNode Orig.ParentNode
derive instance newtypeParentNode :: Newtype ParentNode _

newtype NonDocumentTypeChildNode = NonDocumentTypeChildNode Orig.NonDocumentTypeChildNode
derive instance newtypeNonDocumentTypeChildNode :: Newtype NonDocumentTypeChildNode _

newtype ChildNode = ChildNode Orig.ChildNode
derive instance newtypeChildNode :: Newtype ChildNode _

newtype NodeList = NodeList Orig.NodeList
derive instance newtypeNodeList :: Newtype NodeList _

newtype HTMLCollection = HTMLCollection Orig.HTMLCollection
derive instance newtypeHTMLCollection :: Newtype HTMLCollection _

newtype DOMTokenList = DOMTokenList Orig.DOMTokenList
derive instance newtypeDOMTokenList :: Newtype DOMTokenList _

newtype Document = Document Orig.Document
derive instance newtypeDocument :: Newtype Document _

newtype Element = Element Orig.Element
derive instance newtypeElement :: Newtype Element _


-- HasForeignTag instances

instance foreignTagForDocument :: HasForeignTag Document where
  foreignTag _ = "Document"


-- ReadForeign instances

instance readDocument :: ReadForeign Document where
  readForeign = Foreign.greadForeign


-- ForeignCoerce instances

instance documentToNonElementParentNode :: ForeignCoercible Document NonElementParentNode
