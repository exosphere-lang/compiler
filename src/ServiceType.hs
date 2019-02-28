{-# LANGUAGE DeriveGeneric #-}

module ServiceType where

import Data.Aeson
import GHC.Generics
import ServiceTypes.S3

data ServiceType
  = ServiceType S3
 deriving (Eq, Show, Generic)

instance ToJSON ServiceType