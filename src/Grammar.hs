module Grammar where

data Program  = Program  { getResources :: [Resource] } deriving (Eq, Show)
data Resource = Resource { getTokens    :: [Token]    } deriving (Eq, Show)

data Token
  = Word String
  | Keyword ServiceType
  deriving (Eq, Show)

data ServiceType = S3 deriving (Eq, Show)
