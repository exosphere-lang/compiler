module Parser.SyntacticAnalysisSpec (spec) where

import Test.Hspec
import Parser.ParseError.Errors
import Lexer.Grammar
import qualified Parser.AST as AST
import Parser.SyntacticAnalysis
import ServiceType (ServiceType(..))

spec :: Spec
spec =
  describe "SyntacticAnalysis" $ do
    describe "Unsuccesful parse" $ do
      it "returns EmptyProgram error if given empty program" $ do
        let expectedResponse = [EmptyProgram]

        let Left results = analyse $ Program [] 
        results `shouldBe` expectedResponse
      
      it "returns a No program found InvalidSyntax error when given an empty program" $ do
        let expectedError =  [NoResourceTypeSpecified]

        let Left result = analyse (Program [Resource [Word ""]])
        result `shouldBe` expectedError

      it "returns error when no resource type is specified" $ do
        let expectedError = [NoResourceTypeSpecified]

        let Left result = analyse (Program [Resource [Word "MyExampleBucket"]])
        result `shouldBe` expectedError

      it "returns error when resource type does not come after the resource name" $ do
        let expectedError = [ResourceTypeShouldComeAfterResourceName]

        let Left result = analyse (Program [Resource [Keyword S3, Word "MyExampleBucket"]])
        result `shouldBe` expectedError

      it "returns InvalidResource when a keyword is not preceeded by a resource name" $ do
        let expectedResponse = [ResourceNameShouldComeBeforeResourceType]

        let Left result = analyse (Program [Resource [Word "MyExampleBucket", Word "MyOtherExampleBucket"]])
        result `shouldBe` expectedResponse
      
      it "returns InvalidResource when a resource type is followed by a resource type" $ do
        let expectedResponse = [ResourceTypeShouldComeAfterResourceName]

        let Left result = analyse (Program [Resource [Keyword S3, Keyword S3]])
        result `shouldBe` expectedResponse

    describe "Succesful parse" $ do
      it "returns syntax tree for a resource with a name and type" $ do
        let expectedResponse = AST.AST [AST.Resource "MyExampleBucket" S3]

        let Right result = analyse (Program [Resource [Word "MyExampleBucket", Keyword S3]])
        result `shouldBe` expectedResponse
  