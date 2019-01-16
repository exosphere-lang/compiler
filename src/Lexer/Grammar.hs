module Lexer.Grammar where

import ServiceType (ServiceType)

data Program  = Program  { getProgramResources :: [Resource] } 
  deriving (Eq, Show)

data Resource = Resource { getResourceTokens :: [Token] } 
  deriving (Eq, Show)

data Token
  = Word String
  | Keyword ServiceType
  deriving (Eq, Show)
