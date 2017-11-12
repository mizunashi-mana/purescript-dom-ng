module Test.Main where

import Prelude
import Control.Monad.Aff.AVar     (AVAR)
import Control.Monad.Aff.Console  (CONSOLE)
import Control.Monad.Eff          (Eff)
import Control.Monad.Eff.Timer    (TIMER, setTimeout)
import Data.DOM.HTML              (WINDOW, DOM)
import Test.Unit.Console          (TESTOUTPUT)
import Test.Unit.Main             (runTest, exit)

import Test.Spec.HTMLDocument     (testsHtmlDocument)

main :: forall eff. Eff
  ( console :: CONSOLE
  , testOutput :: TESTOUTPUT
  , avar :: AVAR
  , dom :: DOM
  , window :: WINDOW
  , timer :: TIMER
  | eff) Unit
main = do
  runTest do
    testsHtmlDocument
  void $ setTimeout 100 $ exit 0
