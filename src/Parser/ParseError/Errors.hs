module Parser.ParseError.Errors where

import Text.Megaparsec.Error hiding (ParseError)

data ParseError 
  = EmptyProgram
  | NoServiceTypeSpecified
  | ServiceTypeShouldComeAfterResourceName
  | ResourceNameShouldComeBeforeServiceType
  | InvalidServiceTypeSpecified
  | FatalError
  deriving (Eq, Ord)

instance ShowErrorComponent ParseError where
  showErrorComponent = show

cloudFormationResourceTypeURL :: String
cloudFormationResourceTypeURL = "https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"

instance Show ParseError where
  show EmptyProgram                            = "You have supplied an empty program"
  show NoServiceTypeSpecified                  = "Must supply an AWS service type"
  show ServiceTypeShouldComeAfterResourceName  = "The service type must come after the resource name"
  show ResourceNameShouldComeBeforeServiceType = "The service type must come after the resource name"
  show InvalidServiceTypeSpecified             = "Must be a valid CloudFormation resource type\n" ++ cloudFormationResourceTypeURL
  show FatalError                              = "Fatal error"
