module ParserSpec (spec) where

import Test.Hspec
import CFError
import Grammar
import Parser
import qualified AST as AST

spec :: Spec
spec = do
  describe "Parser" $ do
    it "returns a No program found InvalidSyntax error when given an empty program" $ do
      let expectedError = InvalidResource "No resource type specified"

      let result      = parse (Program [Resource [Word ""]])
      let Left(error) =  result !! 0
      error `shouldBe` expectedError

    it "returns error when no resource type is specified" $ do
      let expectedError = InvalidResource "No resource type specified"

      let result      = parse (Program [Resource [Word "CatPictures"]])
      let Left(error) =  result !! 0
      error `shouldBe` expectedError

    it "returns error when resource type does not come after the resource name" $ do
      let expectedError = InvalidResource "Resource type should come after resource name"

      let result      = parse (Program [Resource [Keyword S3, Word "CatPictures"]])
      let Left(error) =  result !! 0
      error `shouldBe` expectedError

    it "returns syntax tree for a resource with a name and type" $ do
      let expectedResponse = AST.Resource "CatPictures" S3

      let result       = parse (Program [Resource [Word "CatPictures", Keyword S3]])
      let Right(res)   = result !! 0
      res `shouldBe` expectedResponse
