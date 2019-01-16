module Lexer.Keywords where

import Data.Map
import Grammar

keywords :: Map String Token
keywords = fromList 
  [ ("S3", Keyword S3)
  ]
