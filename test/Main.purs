module Test.Main where

import Prelude

import Control.Monad.Aff.AVar     (AVAR)
import Control.Monad.Aff.Console  (CONSOLE)
import Control.Monad.Eff          (Eff)
import Control.Monad.Eff.Timer    (TIMER, setTimeout)
import Data.DOM.Effect            (DOM)
import Data.DOM.HTML              as HTML
import Test.Unit.Console          (TESTOUTPUT)
import Test.Unit.Main             (runTest, exit)

import Test.Spec.HTML.Document     (testsHtmlDocument)
import Test.Spec.HTML.Window       (testsHtmlWindow)
import Test.Spec.Node.DOMTokenList (testsDOMTokenList)

main :: forall eff. Eff
  ( console    :: CONSOLE
  , testOutput :: TESTOUTPUT
  , avar       :: AVAR
  , dom        :: DOM
  , window     :: HTML.WINDOW
  , timer      :: TIMER
  | eff) Unit
main = do
  runTest do
    testsHtmlDocument
    testsHtmlWindow
    testsDOMTokenList
  void $ setTimeout 100 $ exit 0
