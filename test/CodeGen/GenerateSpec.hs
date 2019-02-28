{-# LANGUAGE OverloadedStrings #-}

module CodeGen.GenerateSpec where

import CodeGen.Generate
import Data.Aeson (encode)
import Data.ByteString.Lazy.Char8 hiding (readFile)
import Parser.AST
import ServiceType (ServiceType (..))
import ServiceTypes.S3

import Test.Hspec

spec :: Spec
spec =
  describe "GenerateSpec" $ do

    describe "generateCloudFormationFromAST" $ do
      it "returns a CloudFormationTemplate with a valid CloudFormation Format Version" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [] 
            inputAST         = AST []
        
        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

      it "returns a CF template with a list of resources when given an AST with a single resources" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) []]
            inputAST         = AST [Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [] ]

        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

      it "returns a CF template with a list of resources when given an AST with a list of multiple resources" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [ Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [], Resource "MySecondExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [] ]
            inputAST         = AST [Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [], Resource "MySecondExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [] ]

        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse
     
    describe "generateCloudFormationFromAST" $ do
      it "returns valid cloudformation template with an empty resources object" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithNoResources.json"
        let inputAST = AST [ ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single valid S3 resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalS3Resource.json"
        let inputAST = AST [ Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with two valid S3 resources" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithTwoMinimalS3Resources.json"
        let inputAST = AST [ Resource "MyExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [], Resource "MySecondExampleBucket" (ServiceType $ S3 "AWS::S3::Bucket" Nothing) [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse
