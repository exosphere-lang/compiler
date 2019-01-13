module CFError where

data CFError 
  = InvalidSyntax String 
  | InvalidResource String
  deriving (Eq, Show)
