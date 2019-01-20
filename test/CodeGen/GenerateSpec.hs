{-# LANGUAGE OverloadedStrings #-}

module CodeGen.GenerateSpec where

import CodeGen.Generate
import Data.Aeson (encode)
import Data.ByteString.Lazy.Char8 hiding (readFile)
import Parser.AST
import ServiceType (ServiceType (..))

import Test.Hspec

spec :: Spec
spec =
  describe "GenerateSpec" $ do

    describe "CloudFormationTemplate" $ do
      it "returns a CloudFormationTemplate with a valid CloudFormation Format Version" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [] 
            inputAST         = AST []
        
        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

      it "returns a CF template with a list of resources when given an AST with a list of resources" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [Resource "MyExampleBucket" S3]
            inputAST         = AST [Resource "MyExampleBucket" S3]

        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse
    
    describe "String" $ do
      it "returns valid cloudformation template with an empty resources object" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithNoResources.json"
        let inputAST = AST []

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single valid S3 resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalS3Resource.json"
        let inputAST = AST [ Resource "MyExampleBucket" S3 ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse