{-# LANGUAGE DeriveGeneric #-}

module ServiceTypes.S3 where

import Data.Aeson
import GHC.Generics

data S3 = S3 
  { name         :: String
  , acessControl :: Maybe AccessControl
  } deriving (Eq, Generic, Show)

data AccessControl 
  = AuthenticatedRead 
  | AwsExecRead 
  | BucketOwnerRead 
  | BucketOwnerFullControl 
  | LogDeliveryWrite 
  | Private 
  | PublicRead 
  | PublicReadWrite 
  deriving (Eq, Show, Generic)

instance ToJSON S3
instance ToJSON AccessControl