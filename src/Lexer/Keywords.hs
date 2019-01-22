module Lexer.Keywords where

import Data.Map
import Lexer.Grammar (Token(..))
import ServiceType   (ServiceType(..))

keywords :: Map String Token
keywords = fromList
  [
    ("S3", Keyword S3),
    ("ECSCluster", Keyword ECSCluster)
  ]
