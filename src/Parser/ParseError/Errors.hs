module Parser.ParseError.Errors where

import Text.Megaparsec.Error hiding (ParseError)

data ParseError 
  = EmptyProgram
  | NoResourceTypeSpecified
  | ResourceTypeShouldComeAfterResourceName
  | ResourceNameShouldComeBeforeResourceType
  | FatalError
  deriving (Eq, Show, Ord)

instance ShowErrorComponent ParseError where
  showErrorComponent = show
