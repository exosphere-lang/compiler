module Parser.SyntacticAnalysisSpec (spec) where

import Test.Hspec
import ParseErrors
import Grammar
import qualified AST as AST
import Parser.SyntacticAnalysis

spec :: Spec
spec =
  describe "SyntacticAnalysis" $ do

  it "returns EmptyProgram error if given empty program" $ do
    let expectedResponse = EmptyProgram

    let result      = analyse $ Program [] 
    let Left err   = result !! 0
    err `shouldBe` expectedResponse
  

  it "returns a No program found InvalidSyntax error when given an empty program" $ do
    let expectedError = InvalidResource "No resource type specified"

    let result      = analyse (Program [Resource [Word ""]])
    let Left err =  result !! 0
    err `shouldBe` expectedError

  it "returns error when no resource type is specified" $ do
    let expectedError = InvalidResource "No resource type specified"

    let result      = analyse (Program [Resource [Word "CatPictures"]])
    let Left err =  result !! 0
    err `shouldBe` expectedError

  it "returns error when resource type does not come after the resource name" $ do
    let expectedError = InvalidResource "Resource type should come after resource name"

    let result      = analyse (Program [Resource [Keyword S3, Word "CatPictures"]])
    let Left err =  result !! 0
    err `shouldBe` expectedError

  it "returns syntax tree for a resource with a name and type" $ do
    let expectedResponse = AST.Resource "CatPictures" S3

    let result       = analyse (Program [Resource [Word "CatPictures", Keyword S3]])
    let Right(res)   = result !! 0
    res `shouldBe` expectedResponse

  it "returns InvalidResource when a keyword is not preceeded by a resource name" $ do
    let expectedResponse =  InvalidResource "A resource type must be specified following a resource name"

    let result       = analyse (Program [Resource [Word "CatPictures", Word "DogPictures"]])
    let Left err   = result !! 0
    err `shouldBe` expectedResponse
  
  it "returns InvalidResource when a resource type is followed by a resource type" $ do
    let expectedResponse =  InvalidResource "Resource type should come after resource name"

    let result     = analyse (Program [Resource [Keyword S3, Keyword S3]])
    let Left res   = result !! 0
    res `shouldBe` expectedResponse
  