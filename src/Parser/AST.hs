{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Parser.AST where

import Data.Aeson
import GHC.Generics
import ServiceType (ServiceType)

data AST      = AST [Resource] deriving (Eq, Show, Generic)
data Resource = Resource ResourceName ServiceType deriving (Eq, Show, Generic)

instance ToJSON AST

instance ToJSON Resource where
  toJSON (Resource a _) = object ["a" .= a]

type ResourceName = String
