{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CodeGen.GenerateSpec where

import Data.Aeson
import Data.Aeson.Types
import Data.ByteString.Lazy.Char8 hiding (readFile)
import GHC.Generics
import Parser.AST
import ServiceType (ServiceType (..))
import Test.Hspec

import CodeGen.Generate

spec :: Spec
spec =
  describe "GenerateSpec" $ do
    it "returns a CloudFormationTemplate with a valid CloudFormation Format Version" $ do
      let expectedResponse = CloudFormationTemplate "2010-09-09" [] 
          inputAST         = AST []
      
      generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

    it "returns a CF template with a list of resources when given an AST with a list of resources" $ do
      let expectedResponse = CloudFormationTemplate "2010-09-09" [Resource "MyExampleBucket" S3]
          inputAST         = AST [Resource "MyExampleBucket" S3]

      generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

    it "returns a CF template with a list of resources when given an AST with a list of resources" $ do
      expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithNoResources.json"
      let inputAST = AST []

      unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse
  
