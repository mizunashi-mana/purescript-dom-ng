module DOMPrelude
  ( module Data.DOM.Effect

  , module Control.DOM.HTML
  , module Control.DOM.HTML.Window
  , module Control.DOM.HTML.Document
  ) where

import Data.DOM.Effect (DOM)

import Control.DOM.HTML (window)
import Control.DOM.HTML.Window (document)
import Control.DOM.HTML.Document (body)
