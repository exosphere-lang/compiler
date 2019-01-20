module Lexer.Keywords where

import Data.Map
import ServiceType (ServiceType(..))
import Lexer.Grammar     (Token(..))

keywords :: Map String Token
keywords = fromList 
  [ 
    ("S3", Keyword S3)
  ]
