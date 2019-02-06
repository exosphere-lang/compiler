module Parser.ParseError.Errors where

import Text.Megaparsec.Error hiding (ParseError)

data ParseError 
  = EmptyProgram
  | NoResourceTypeSpecified
  | ResourceTypeShouldComeAfterResourceName
  | ResourceNameShouldComeBeforeResourceType
  | InvalidResourceTypeSpecified
  | FatalError
  deriving (Eq, Ord)

instance ShowErrorComponent ParseError where
  showErrorComponent = show

cloudFormationResourceTypeURL :: String
cloudFormationResourceTypeURL = "https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"

instance Show ParseError where
  show InvalidResourceTypeSpecified = "Must be a valid CloudFormation resource type\n" ++ cloudFormationResourceTypeURL
