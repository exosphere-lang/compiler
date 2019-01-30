module Lexer.Grammar where

import ServiceType (ServiceType)

data Program  = Program  { getProgramResources :: [Resource] } 
  deriving (Eq, Show)

data Resource = Resource { getResourceTokens :: [Token] } 
  deriving (Eq, Show)

data Token
  = Word String
  | Keyword ServiceType
  | Symbol Punctuation
  deriving (Eq, Show)

data Punctuation 
  = OpenBrace
  | ClosedBrace
  deriving (Eq, Show)