module AST where

import ServiceType (ServiceType)

data AST      = AST [Resource] deriving (Eq, Show)
data Resource = Resource ResourceName ServiceType deriving (Eq, Show)

type ResourceName = String
