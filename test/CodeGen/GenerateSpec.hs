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

    describe "generateCloudFormationFromAST" $ do
      it "returns a CloudFormationTemplate with a valid CloudFormation Format Version" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [] 
            inputAST         = AST []
        
        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

      it "returns a CF template with a list of resources when given an AST with a single resources" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [Resource "MyExampleBucket" S3 []]
            inputAST         = AST [Resource "MyExampleBucket" S3 [] ]

        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse

      it "returns a CF template with a list of resources when given an AST with a list of multiple resources" $ do
        let expectedResponse = CloudFormationTemplate "2010-09-09" [ Resource "MyExampleBucket" S3 [], Resource "MySecondExampleBucket" S3 [] ]
            inputAST         = AST [Resource "MyExampleBucket" S3 [], Resource "MySecondExampleBucket" S3 [] ]

        generateCloudFormationFromAST inputAST `shouldBe` expectedResponse
    
    describe "generateCloudFormationFromAST" $ do
      it "returns valid cloudformation template with an empty resources object" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithNoResources.json"
        let inputAST = AST [ ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single valid S3 resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalS3Resource.json"
        let inputAST = AST [ Resource "MyExampleBucket" S3 [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with two valid S3 resources" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithTwoMinimalS3Resources.json"
        let inputAST = AST [ Resource "MyExampleBucket" S3 [], Resource "MySecondExampleBucket" S3 [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single ECS Cluster resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalECSClusterResource.json"
        let inputAST = AST [ Resource "MyExampleBucket" ECSCluster [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single ApiGateway Account resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalApiGatewayAccountResource.json"
        let inputAST = AST [ Resource "MyApiGatewayAccount" ApiGatewayAccount [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single ApiGateway API Key resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalApiGatewayApiKeyResource.json"
        let inputAST = AST [ Resource "MyApiGatewayApiKey" ApiGatewayApiKey [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single ApiGateway Client Certificate resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalApiGatewayClientCertificateResource.json"
        let inputAST = AST [ Resource "MyApiGatewayClientCertificate" ApiGatewayClientCertificate [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse
    
      it "returns valid cloudformation template with a single ApiGateway RestApi resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalApiGatewayRestApiResource.json"
        let inputAST = AST [ Resource "MyApiGatewayRestApi" ApiGatewayRestApi [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single ApiGateway UsagePlan resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalApiGatewayRestUsagePlan.json"
        let inputAST = AST [ Resource "MyApiGatewayUsagePlan" ApiGatewayUsagePlan [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse

      it "returns valid cloudformation template with a single AppStream Stack resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalAppStreamStack.json"
        let inputAST = AST [ Resource "MyAppStreamStack" AppStreamStack [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse
    
      it "returns valid cloudformation template with a single AppStream Api Key resource" $ do
        expectedResponse <- readFile "./test/CodeGen/fixtures/TemplateWithMinimalAppSyncApiKey.json"
        let inputAST = AST [ Resource "MyAppSyncApiKey" AppSyncApiKey [] ]

        unpack (encode (generateCloudFormationFromAST inputAST)) `shouldBe` expectedResponse
