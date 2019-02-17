{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Parser.AST where

import qualified Data.Map.Strict as Map
import           Data.Aeson
import qualified Data.Text    as T
import           GHC.Generics
import           ServiceType  (ServiceType)

data PropertyKey = AccessControl deriving (Eq, Show, Generic)
data PropertyValue = Private deriving (Eq, Show, Generic)

data AST          = AST [Resource]                    deriving (Eq, Show, Generic)
data Resource     = Resource ResourceName ServiceType deriving (Eq, Show, Generic)
type ResourceName = String



instance ToJSON AST

instance ToJSON Resource where
  toJSON (Resource resourceName serviceType) = 
    object 
      [ (T.pack resourceName) .= object [ "Type" .= (show serviceType) ]
      ]
