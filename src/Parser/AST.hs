{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Parser.AST where

import Data.Aeson
import GHC.Generics
import qualified Data.Text as T
import ServiceType (ServiceType)

data AST      = AST [Resource] deriving (Eq, Show, Generic)
data Resource = Resource ResourceName ServiceType deriving (Eq, Show, Generic)

instance ToJSON AST

instance ToJSON Resource where
  toJSON (Resource resourceName serviceType) = object [(T.pack resourceName) .= object [ "Type" .= (show serviceType) ]]

type ResourceName = String
