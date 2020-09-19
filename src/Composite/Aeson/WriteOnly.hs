{- |
   Module     : Composite.Aeson.WriteOnly
   License    : MIT
   Stability  : experimental

Exports WriteOnly indicators for JsonProfunctor.
-}
module Composite.Aeson.WriteOnly (
  WriteOnlyJsonField
, noRead
, writeOnlyJsonFormat
) where

import Composite.Aeson
import Data.Aeson
import Data.Aeson.BetterErrors
import Data.Functor.Identity

data WriteOnlyJsonField = WriteOnlyJsonField
  deriving Show

noRead :: ParseT WriteOnlyJsonField Identity a
noRead = throwCustomError WriteOnlyJsonField

writeOnlyJsonFormat :: (a -> Value) -> JsonFormat e a
writeOnlyJsonFormat f = jsonFormatWithoutCustomError $ JsonFormat $ JsonProfunctor f noRead
