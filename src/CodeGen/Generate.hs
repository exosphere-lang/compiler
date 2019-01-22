{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.Generate where 

import Data.Aeson
import Data.Aeson.Types
import GHC.Generics
import Parser.AST

import qualified Data.HashMap.Lazy as HML

mergeAeson :: [Value] -> Value
mergeAeson listOfValues = Object . HML.unions $ map (\(Object x) -> x) listOfValues

cloudFormationFormatVersion :: FormatVersion
cloudFormationFormatVersion = "2010-09-09"

data CloudFormationTemplate = CloudFormationTemplate FormatVersion [Resource] deriving (Eq, Show, Generic)
type FormatVersion = String

generateCloudFormationFromAST :: AST -> CloudFormationTemplate
generateCloudFormationFromAST (AST res) = CloudFormationTemplate cloudFormationFormatVersion res

cloudFormationWithNoResources :: FormatVersion -> Value
cloudFormationWithNoResources formatVersion = object [ "AWSTemplateFormatVersion" .= formatVersion, "Resources" .= emptyObject ]

cloudFormationWithSingleResource :: FormatVersion -> [Resource] -> Value
cloudFormationWithSingleResource formatVersion resources = 
  object [ "AWSTemplateFormatVersion" .= formatVersion, "Resources" .= (mergeAeson $ map toJSON resources) ]

instance ToJSON CloudFormationTemplate where
  toJSON (CloudFormationTemplate formatVersion []) = cloudFormationWithNoResources formatVersion
  toJSON (CloudFormationTemplate formatVersion resources) = cloudFormationWithSingleResource formatVersion resources
  