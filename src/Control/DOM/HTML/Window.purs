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
