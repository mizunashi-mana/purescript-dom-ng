module Control.DOM.CSS.Window where

import Prelude

import Control.Monad.Eff   (Eff)
import Data.DOM.Effect     (DOM)
import Data.DOM.HTML       as HTML
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import Data.Newtype        (op)
import DOM.HTML.Window     as Orig

moveBy :: forall w eff. ForeignCoercible w HTML.Window => Int -> Int -> w -> Eff (window :: HTML.WINDOW | eff) Unit
moveBy x y = foreignLeftCoerce $ Orig.moveBy x y <<< op HTML.Window

moveTo :: forall w eff. ForeignCoercible w HTML.Window => Int -> Int -> w -> Eff (window :: HTML.WINDOW | eff) Unit
moveTo x y = foreignLeftCoerce $ Orig.moveTo x y <<< op HTML.Window

innerWidth :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
innerWidth = foreignLeftCoerce $ Orig.innerWidth <<< op HTML.Window

innerHeight :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
innerHeight = foreignLeftCoerce $ Orig.innerHeight <<< op HTML.Window

outerWidth :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
outerWidth = foreignLeftCoerce $ Orig.outerWidth <<< op HTML.Window

outerHeight :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
outerHeight = foreignLeftCoerce $ Orig.outerHeight <<< op HTML.Window

resizeBy :: forall w eff. ForeignCoercible w HTML.Window => Int -> Int -> w -> Eff (window :: HTML.WINDOW | eff) Unit
resizeBy x y = foreignLeftCoerce $ Orig.resizeBy x y <<< op HTML.Window

resizeTo :: forall w eff. ForeignCoercible w HTML.Window => Int -> Int -> w -> Eff (window :: HTML.WINDOW | eff) Unit
resizeTo x y = foreignLeftCoerce $ Orig.resizeTo x y <<< op HTML.Window

screenX :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
screenX = foreignLeftCoerce $ Orig.screenX <<< op HTML.Window

screenY :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) Int
screenY = foreignLeftCoerce $ Orig.screenY <<< op HTML.Window
