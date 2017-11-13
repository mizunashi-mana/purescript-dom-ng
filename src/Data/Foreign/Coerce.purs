module Data.Foreign.Coerce where

import Unsafe.Coerce as U
import Data.Profunctor (class Profunctor)

class ForeignCoercible a b

-- axioms: should be implemented
instance foreignCoercibleIdentity :: ForeignCoercible a a
-- Overlapping instance and maybe checkings are infinite
-- instance foreignCoercibleTransitivity :: (ForeignCoercible a b, ForeignCoercible b c) => ForeignCoercible a c

foreignCoerce :: forall a b. ForeignCoercible a b => a -> b
foreignCoerce = U.unsafeCoerce

foreignRightCoerce :: forall p a b c. Profunctor p => ForeignCoercible b c => p a b -> p a c
foreignRightCoerce = U.unsafeCoerce

foreignLeftCoerce :: forall p a b c. Profunctor p => ForeignCoercible a b => p b c -> p a c
foreignLeftCoerce = U.unsafeCoerce
