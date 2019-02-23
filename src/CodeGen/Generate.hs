{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.Generate where 

import Data.Aeson
import Data.Aeson.Types
import GHC.Generics
import Parser.AST

data CloudFormationTemplate = CloudFormationTemplate FormatVersion [Resource] deriving (Eq, Show, Generic)
type FormatVersion          = String

instance ToJSON CloudFormationTemplate where
  toJSON (CloudFormationTemplate formatVersion [])        = cloudFormationWithNoResources formatVersion
  toJSON (CloudFormationTemplate formatVersion resources) = cloudFormationWithSingleResource formatVersion resources

cloudFormationFormatVersion :: FormatVersion
cloudFormationFormatVersion = "2010-09-09"

generateCloudFormationFromAST :: AST -> CloudFormationTemplate
generateCloudFormationFromAST (AST res) = CloudFormationTemplate cloudFormationFormatVersion res

cloudFormationWithNoResources :: FormatVersion -> Value
cloudFormationWithNoResources formatVersion = 
  object 
    [ "AWSTemplateFormatVersion" .= formatVersion
    , "Resources"                .= emptyObject 
    ]

cloudFormationWithSingleResource :: FormatVersion -> [Resource] -> Value
cloudFormationWithSingleResource formatVersion resources = 
  object 
    [ "AWSTemplateFormatVersion" .= formatVersion
    , "Resources"                .= (mergeAeson $ map toJSON resources) 
    ]
