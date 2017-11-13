module Control.DOM.HTML.Window where

import Prelude

import Control.Monad.Eff   (Eff)
import Data.DOM.Effect     (DOM)
import Data.DOM.HTML       as HTML
import Data.Foreign.Coerce (class ForeignCoercible, foreignLeftCoerce)
import Data.Maybe          (Maybe, fromMaybe)
import Data.Newtype        (wrap, op)
import DOM.HTML.Window     as Orig
import Control.DOM.HTML    (window)

document :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) HTML.Document
document = foreignLeftCoerce $ map wrap <<< Orig.document <<< op HTML.Window

documentByContext :: forall eff. Eff (dom :: DOM | eff) HTML.Document
documentByContext = document =<< window

location :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) HTML.Location
location = foreignLeftCoerce $ map wrap <<< Orig.location <<< op HTML.Window

history :: forall w eff. ForeignCoercible w HTML.Window
  => w -> Eff (history :: HTML.HISTORY | eff) HTML.History
history = foreignLeftCoerce $ map wrap <<< Orig.history <<< op HTML.Window

navigator :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) HTML.Navigator
navigator = foreignLeftCoerce $ map wrap <<< Orig.navigator <<< op HTML.Window

open :: forall w eff. ForeignCoercible w HTML.Window
  => String -> String -> String -> w -> Eff (window :: HTML.WINDOW | eff) (Maybe HTML.Window)
open urlStr name features = foreignLeftCoerce $ map (map wrap) <<< Orig.open urlStr name features <<< op HTML.Window

url :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (dom :: DOM | eff) HTML.URL
url = foreignLeftCoerce $ map wrap <<< Orig.url <<< op HTML.Window

alert :: forall w eff. ForeignCoercible w HTML.Window => String -> w -> Eff (alert :: HTML.ALERT | eff) Unit
alert msg = foreignLeftCoerce $ Orig.alert msg <<< op HTML.Window

confirm :: forall w eff. ForeignCoercible w HTML.Window => String -> w -> Eff (confirm :: HTML.CONFIRM | eff) Boolean
confirm msg = foreignLeftCoerce $ Orig.confirm msg <<< op HTML.Window

print :: forall w eff. ForeignCoercible w HTML.Window => w -> Eff (window :: HTML.WINDOW | eff) Unit
print = foreignLeftCoerce $ Orig.print <<< op HTML.Window

prompt :: forall w eff. ForeignCoercible w HTML.Window
  => String -> w -> Eff (prompt :: HTML.PROMPT | eff) (Maybe String)
prompt msg = foreignLeftCoerce $ Orig.prompt msg <<< op HTML.Window

promptFull :: forall w eff. ForeignCoercible w HTML.Window
  => Maybe String -> Maybe String -> w -> Eff (prompt :: HTML.PROMPT | eff) (Maybe String)
promptFull msg default = foreignLeftCoerce
  $ Orig.promptDefault (fromMaybe "" msg) (fromMaybe "" default) <<< op HTML.Window

-- CSSOM View: https://www.w3.org/TR/cssom-view-1/#extensions-to-the-window-interface

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
