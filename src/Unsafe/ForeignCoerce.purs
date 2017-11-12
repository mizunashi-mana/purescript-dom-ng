module Unsafe.ForeignCoerce where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either          (either)
import Data.Foreign         (F, Foreign)
import Data.Maybe           (Maybe (..))
import DOM.Util.FFI         (unsafeReadProtoTagged)
import Type.Proxy           (Proxy (..))
import Unsafe.Coerce        as U

class ForeignCoercible a b where
  foreignCoerce :: a -> b

gforeignCoerce :: forall a b. a -> b
gforeignCoerce = U.unsafeCoerce

class ReadForeign a where
  readForeign :: Foreign -> F a


class HasForeignTag a where
  foreignTag :: Proxy a -> String

greadForeign :: forall a. HasForeignTag a => Foreign -> F a
greadForeign = unsafeReadProtoTagged $ foreignTag (Proxy :: Proxy a)


fromAny :: forall n a. (Foreign -> F n) -> a -> Maybe n
fromAny f = either (const Nothing) Just <<< runExcept <<< U.unsafeCoerce f

restoreForeign :: forall n a. ReadForeign n => a -> Maybe n
restoreForeign = fromAny readForeign
