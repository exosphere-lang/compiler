{-# LANGUAGE DeriveGeneric #-}

module ServiceType where

import Data.Aeson
import GHC.Generics

data ServiceType = S3 deriving (Eq, Generic)

instance Show ServiceType where
    show S3 = "AWS::S3::Bucket"

instance ToJSON ServiceType
