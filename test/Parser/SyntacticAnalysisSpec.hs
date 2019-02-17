module Parser.SyntacticAnalysisSpec (spec) where

import Parser.AST
import Parser.ParseError.Errors
import Parser.SyntacticAnalysis
import ServiceType (ServiceType(..))
import Test.Hspec

import Text.Megaparsec.Error

spec :: Spec
spec = do
  describe "Parsing" $ do
    describe "resources lexing" $ do
      it "returns unexpected end of input if nothing is provided" $ do
        let expectedResult = "1:1:\nunexpected end of input\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = analyse ""
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected space if a string with a single space is provided" $ do
        let expectedResult = "1:1:\nunexpected space\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = analyse " "
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected end of input if a string with a newline is provided" $ do
        let expectedResult = "1:1:\nunexpected newline\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = analyse "\n"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected end of input when given only a resource name" $ do
        let expectedResult = "1:16:\nunexpected end of input\nexpecting alphanumeric character or white space\n"

        let (Left result) = analyse "MyExampleBucket"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "turns MyExampleBucket S3 into AST of MyExampleBucket and S3" $ do
        let expectedResult = AST [ Resource "MyExampleBucket" S3 ]

        let (Right result) = analyse "MyExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns an InvalidServiceTypeSpecified error when given S3 MyExampleBucket" $ do
        let expectedResult = "1:19:\n" ++ show InvalidServiceTypeSpecified ++ "\n"

        let (Left result) = analyse "S3 MyExampleBucket"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "turns an arbitary number of Keywords and Words into multiple AST resources" $ do
        let expectedResult = AST [ Resource "MyExampleBucket" S3, Resource "MyOtherExampleBucket" S3 ]

        let (Right result) = analyse "MyExampleBucket S3 MyOtherExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns a AST with a single resource when given a single resource with a trailing carriage return" $ do
        let expectedResult =  AST [ Resource "MyExampleBucket" S3 ]
          
        let (Right result) = analyse "MyExampleBucket S3\n"
        result `shouldBe` expectedResult

    describe "comments lexing" $ do
      it "returns an unexpected end of input when given only a single comment" $ do
        let expectedResult = "2:1:\nunexpected end of input\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = analyse "// this is a comment\n"
        parseErrorPretty result `shouldBe` expectedResult

      it "returns a AST when given a single comment on the line above the AST" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 ]

        let (Right result) = analyse "// this is a comment\nExampleBucket S3"
        result `shouldBe` expectedResult

  -- describe "symbols lexing" $ do
  --   it "an open brace is analysed into a OpenBrace symbol" $ do
  --     let expectedResult = AST [ Resource [ "S3Bucket", S3, Symbol OpenBrace ] ]
        
  --     let result = analyse "S3Bucket S3 {"
  --     result `shouldBe` expectedResult

  --   it "an closed brace is analysed into a ClosedBrace symbol" $ do
  --     let expectedResult = AST [ Resource [ "S3Bucket", S3, Symbol ClosedBrace ] ]
        
  --     let result = analyse "S3Bucket S3 }"
  --     result `shouldBe` expectedResult

  --   it "a open brace followed by a closed brace is analysed into two symbols respectivley OpenBrace ClosedBrace" $ do
  --     let expectedResult = AST [ Resource [ "S3Bucket", S3, Symbol OpenBrace, Symbol ClosedBrace ] ]
        
  --     let result = analyse "S3Bucket S3 {}"
  --     result `shouldBe` expectedResult
  