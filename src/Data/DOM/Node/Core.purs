module Data.DOM.Node.Core where

import DOM.Node.Types       as Orig
import Data.Newtype         (class Newtype, wrap)
import Unsafe.ForeignCoerce (class ReadForeign, class ForeignCoercible, class HasForeignTag)
import Unsafe.ForeignCoerce as FC

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

newtype Document = Document Orig.Document
derive instance newtypeDocument :: Newtype Document _


-- HasForeignTag instances

instance foreignTagForDocument :: HasForeignTag Document where
  foreignTag _ = "Document"


-- ReadForeign instances

instance readDocument :: ReadForeign Document where
  readForeign = FC.greadForeign


-- ForeignCoerce instances

instance documentToNonElementParentNode :: ForeignCoercible Document NonElementParentNode where
  foreignCoerce = FC.gforeignCoerce

