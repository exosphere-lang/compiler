module Lexer.LexerSpec (spec) where

import Lexer.Grammar
import Lexer.Lexer
import Parser.ParseError.Errors
import ServiceType (ServiceType(..))
import Test.Hspec

import Text.Megaparsec.Error

spec :: Spec
spec = do
  describe "Lexer" $ do
    describe "resources lexing" $ do
      it "returns unexpected end of input if nothing is provided" $ do
        let expectedResult = "1:1:\nunexpected end of input\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = lexe ""
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected space if a string with a single space is provided" $ do
        let expectedResult = "1:1:\nunexpected space\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = lexe " "
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected end of input if a string with a newline is provided" $ do
        let expectedResult = "1:1:\nunexpected newline\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = lexe "\n"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns unexpected end of input when given only a resource name" $ do
        let expectedResult = "1:16:\nunexpected end of input\nexpecting alphanumeric character or white space\n"

        let (Left result) = lexe "MyExampleBucket"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "returns MyExampleBucket S3 into tokens of Word MyExampleBucket and Keyword S3" $ do
        let expectedResult = Program [ Resource [Word "MyExampleBucket", Keyword S3] ]

        let (Right result) = lexe "MyExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns S3 MyExampleBucket into tokens of Keyword S3 and Word MyExampleBucket" $ do
        let expectedResult = "1:19:\n" ++ show InvalidResourceTypeSpecified ++ "\n"

        let (Left result) = lexe "S3 MyExampleBucket"
        (parseErrorPretty result) `shouldBe` expectedResult


      it "returns an arbitary number of Keywords and Words into multiple resources" $ do
        let expectedResult = Program [ Resource [ Word "MyExampleBucket", Keyword S3], Resource [ Word "MyOtherExampleBucket", Keyword S3 ] ]

        let (Right result) = lexe "MyExampleBucket S3 MyOtherExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns a program with a single resources and its respective keyword and word tokens when the input has a trailing carriage return" $ do
        let expectedResult =  Program [ Resource [ Word "MyExampleBucket", Keyword S3]]
          
        let (Right result) = lexe "MyExampleBucket S3\n"
        result `shouldBe` expectedResult

    describe "comments lexing" $ do
      it "returns an unexpected end of input when given only a single comment" $ do
        let expectedResult = "2:1:\nunexpected end of input\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = lexe "// this is a comment\n"
        parseErrorPretty result `shouldBe` expectedResult

      it "returns a program when given a single comment on the line above the program" $ do
        let expectedResult =  Program [ Resource [ Word "ExampleBucket", Keyword S3]]

        let (Right result) = lexe "// this is a comment\nExampleBucket S3"
        result `shouldBe` expectedResult

  -- describe "symbols lexing" $ do
  --   it "an open brace is lexed into a OpenBrace symbol" $ do
  --     let expectedResult = Program [ Resource [ Word "S3Bucket", Keyword S3, Symbol OpenBrace ] ]
        
  --     let result = lexe "S3Bucket S3 {"
  --     result `shouldBe` expectedResult

  --   it "an closed brace is lexed into a ClosedBrace symbol" $ do
  --     let expectedResult = Program [ Resource [ Word "S3Bucket", Keyword S3, Symbol ClosedBrace ] ]
        
  --     let result = lexe "S3Bucket S3 }"
  --     result `shouldBe` expectedResult

  --   it "a open brace followed by a closed brace is lexed into two symbols respectivley OpenBrace ClosedBrace" $ do
  --     let expectedResult = Program [ Resource [ Word "S3Bucket", Keyword S3, Symbol OpenBrace, Symbol ClosedBrace ] ]
        
  --     let result = lexe "S3Bucket S3 {}"
  --     result `shouldBe` expectedResult
