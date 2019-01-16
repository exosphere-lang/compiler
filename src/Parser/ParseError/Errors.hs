module Parser.ParseError.Errors where

data ParseError 
  = EmptyProgram
  | NoResourceTypeSpecified
  | ResourceTypeShouldComeAfterResourceName
  | ResourceNameShouldComeBeforeResourceType
  | FatalError
  deriving (Eq, Show)
