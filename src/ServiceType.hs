{-# LANGUAGE DeriveGeneric #-}

module ServiceType where

import Data.Aeson
import GHC.Generics

data ServiceType = S3 | ECSCluster deriving (Eq, Generic)

instance Show ServiceType where
    show S3 = "AWS::S3::Bucket"
    show ECSCluster = "AWS::ECS::Cluster"

instance ToJSON ServiceType
