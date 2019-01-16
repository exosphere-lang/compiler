module Lexer.Grammar where

import ServiceType (ServiceType)

data Program  = Program  { getResources :: [Resource] } 
  deriving (Eq, Show)

data Resource = Resource { getTokens :: [Token] } 
  deriving (Eq, Show)

data Token
  = Word String
  | Keyword ServiceType
  deriving (Eq, Show)
