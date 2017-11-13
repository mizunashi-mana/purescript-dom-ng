module Data.Foreign.Read where

import Prelude
import Control.Monad.Except (runExcept)
import Data.Either          (either)
import Data.Foreign         (Foreign, F)
import Data.Maybe           (Maybe(..))
import Type.Proxy           (Proxy(..))
import DOM.Util.FFI         (unsafeReadProtoTagged)
import Unsafe.Coerce        as U

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
