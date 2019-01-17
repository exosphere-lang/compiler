{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.Generate where 

import Data.Aeson
import Data.Aeson.Types
import Data.ByteString.Lazy.Char8 hiding (readFile)
import GHC.Generics
import Parser.AST
import ServiceType (ServiceType (..))

data CloudFormationTemplate = CloudFormationTemplate FormatVersion [Resource] deriving (Eq, Show, Generic)
type FormatVersion = String

generateCloudFormationFromAST (AST res) = CloudFormationTemplate "2010-09-09" res

instance ToJSON CloudFormationTemplate where
  toJSON (CloudFormationTemplate formatVersion []) = 
    object [ "AWSTemplateFormatVersion" .= formatVersion, "Resources" .= emptyObject ]
