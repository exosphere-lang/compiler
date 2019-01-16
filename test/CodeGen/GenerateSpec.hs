module CodeGen.GenerateSpec where

import Test.Hspec
import Parser.AST
import ServiceType (ServiceType (..))

generate :: AST -> String
generate (AST []) = "{ \"AWSTemplateFormatVersion\": \"2010-09-09\" }"
generate ast = "{ \"AWSTemplateFormatVersion\": \"2010-09-09\", \"Resources\": { \"MyResource\": { \"Type\": \"AWS::S3::Bucket\" }}}"

spec :: Spec
spec =
  describe "GenerateSpec" $ do
    it "returns a root JSON string with an AWSTemplateFormatVersion as a property and no resources" $ do
        let expectedResult = "{ \"AWSTemplateFormatVersion\": \"2010-09-09\" }"

        generate (AST []) `shouldBe` expectedResult

    it "returns a JSON string with a single resource type of S3 and a resource name of MyResource" $ do
        let expectedResult = "{ \"AWSTemplateFormatVersion\": \"2010-09-09\", \"Resources\": { \"MyResource\": { \"Type\": \"AWS::S3::Bucket\" }}}"

        generate (AST [Resource "MyResource" S3]) `shouldBe` expectedResult