module Data.Foreign.Coerce where

import Unsafe.Coerce as U

class ForeignCoercible a b

-- axioms: should be implemented
instance foreignCoercibleIdentity :: ForeignCoercible a a
-- Overlapping instance and maybe checkings are infinite
-- instance foreignCoercibleTransitivity :: (ForeignCoercible a b, ForeignCoercible b c) => ForeignCoercible a c

foreignCoerce :: forall a b. ForeignCoercible a b => a -> b
foreignCoerce = U.unsafeCoerce
