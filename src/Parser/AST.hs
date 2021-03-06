{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Parser.AST where

import           Data.Aeson
import qualified Data.HashMap.Lazy as HML
import qualified Data.Text         as T
import           GHC.Generics
import           ServiceType  (ServiceType(..))
import ServiceTypes.S3


data PropertyKey = AccessControl deriving (Eq, Show, Generic)
data PropertyValue = Private deriving (Eq, Show, Generic)

mergeAeson :: [Value] -> Value
mergeAeson listOfValues = Object . HML.unions $ map (\(Object x) -> x) listOfValues

data AST = AST [Resource]                    
  deriving (Eq, Show, Generic)

data Resource = Resource ResourceName ServiceType [Property]
  deriving (Eq, Show, Generic)

data Property = Property String String
  deriving (Eq, Show, Generic)

type ResourceName = String

instance ToJSON AST

instance ToJSON Resource where
  toJSON (Resource resourceName (ServiceType resource) []) = 
    object 
      [ (T.pack resourceName) .= object
        [ "Type" .= name resource
        ]
      ]
  toJSON (Resource resourceName (ServiceType resource) properties) = 
    object 
      [ (T.pack resourceName) .= object
        [ "Type"       .= name resource
        , "Properties" .= (mergeAeson $ map propertyToJSON properties)
        ]
      ]

propertyToJSON :: Property -> Value
propertyToJSON (Property a b) = object [ T.pack a .= b ]
