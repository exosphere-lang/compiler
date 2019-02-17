{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.Generate where 

import           Data.Aeson
import           Data.Aeson.Types
import qualified Data.HashMap.Lazy as HML
import           GHC.Generics
import           Parser.AST

data CloudFormationTemplate = CloudFormationTemplate FormatVersion [Resource] deriving (Eq, Show, Generic)
type FormatVersion          = String

instance ToJSON CloudFormationTemplate where
  toJSON (CloudFormationTemplate formatVersion [])        = cloudFormationWithNoResources formatVersion
  toJSON (CloudFormationTemplate formatVersion resources) = cloudFormationWithSingleResource formatVersion resources

mergeAeson :: [Value] -> Value
mergeAeson listOfValues = Object . HML.unions $ map (\(Object x) -> x) listOfValues

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
