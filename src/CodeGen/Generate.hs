{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.Generate where 

import Data.Aeson
import Data.Aeson.Types
import GHC.Generics
import Parser.AST

cloudFormationFormatVersion :: FormatVersion
cloudFormationFormatVersion = "2010-09-09"

data CloudFormationTemplate = CloudFormationTemplate FormatVersion [Resource] deriving (Eq, Show, Generic)
type FormatVersion = String

generateCloudFormationFromAST :: AST -> CloudFormationTemplate
generateCloudFormationFromAST (AST res) = CloudFormationTemplate cloudFormationFormatVersion res

cloudFormationWithNoResources :: FormatVersion -> Value
cloudFormationWithNoResources formatVersion = object [ "AWSTemplateFormatVersion" .= formatVersion, "Resources" .= emptyObject ]

cloudFormationWithSingleResource :: FormatVersion -> Resource -> Value
cloudFormationWithSingleResource formatVersion resource = object [ "AWSTemplateFormatVersion" .= formatVersion, "Resources" .= resource ]

instance ToJSON CloudFormationTemplate where
  toJSON (CloudFormationTemplate formatVersion []) = cloudFormationWithNoResources formatVersion
  toJSON (CloudFormationTemplate formatVersion [resource]) = cloudFormationWithSingleResource formatVersion resource
