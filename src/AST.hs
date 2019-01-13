module AST where

import qualified Grammar as Grammar

data CFTree    = CFTree [Resource] deriving (Eq, Show)
data Resource  = Resource ResourceName Grammar.ServiceType deriving (Eq, Show)

type ResourceName = String
