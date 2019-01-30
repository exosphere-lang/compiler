module Lexer.LexerSpec (spec) where

import Lexer.Lexer
import Test.Hspec
import Lexer.Grammar
import ServiceType (ServiceType(..))

spec :: Spec
spec = do
  describe "Lexer" $ do
    it "returns empty program if empty string is provided" $ do
      let expectedResult = Program [ Resource [ Word "" ] ]

      let result = lexe ""
      result `shouldBe` expectedResult

    it "returns MyExampleBucket into a Token of Word with literal value MyExampleBucket" $ do
      let expectedResult = Program [ Resource [ Word "MyExampleBucket"] ]

      let result = lexe "MyExampleBucket"
      result `shouldBe` expectedResult

    it "returns S3 into a Token of ServiceType of S3" $ do
        let expectedResult = Program [ Resource [Keyword S3] ]
  
        let result = lexe "S3"
        result `shouldBe` expectedResult

    it "returns MyExampleBucket S3 into tokens of Word MyExampleBucket and Keyword S3" $ do
      let expectedResult = Program [ Resource [Word "MyExampleBucket", Keyword S3] ]

      let result = lexe "MyExampleBucket S3"
      result `shouldBe` expectedResult

    it "returns S3 MyExampleBucket into tokens of Keyword S3 and Word MyExampleBucket" $ do
      let expectedResult = Program [ Resource [Keyword S3, Word "MyExampleBucket"] ]

      let result = lexe "S3 MyExampleBucket"
      result `shouldBe` expectedResult

    it "returns an arbitary number of Keywords and Words" $ do
      let expectedResult = Program [ Resource [Keyword S3, Word "MyExampleBucket", Word "MyOtherExampleBucket", Keyword S3 ] ]

      let result = lexe "S3 MyExampleBucket MyOtherExampleBucket S3"
      result `shouldBe` expectedResult

    it "returns a program with two resources and their respective keyword and word tokens" $ do
      let expectedResult = Program [ Resource [ Keyword S3, Word "MyExampleBucket" ], Resource [ Keyword S3, Word "MyOtherExampleBucket" ] ]
        
      let result = lexe "S3 MyExampleBucket\nS3 MyOtherExampleBucket"
      result `shouldBe` expectedResult

    it "returns a program with a single resources and its respective keyword and word tokens when the input has a trailing carriage return" $ do
      let expectedResult = Program [ Resource [ Keyword S3, Word "MyExampleBucket" ] ]
        
      let result = lexe "S3 MyExampleBucket\n"
      result `shouldBe` expectedResult

    it "returns a program with a single resource of keyword ECSCluster and word MyExampleCluster" $ do
      let expectedResult = Program [ Resource [Word "S3Bucket", Keyword S3], Resource [ Keyword ECSCluster, Word "MyExampleCluster" ] ]
        
      let result = lexe "S3Bucket S3\nECSCluster MyExampleCluster\n"
      result `shouldBe` expectedResult

  describe "comments lexing" $ do
    it "returns an empty program when given only a single comment" $ do
      let expectedResult = Program []
        
      let result = lexe "// this is a comment"
      result `shouldBe` expectedResult

    it "returns a program ignoring the comment line but lexing a valid resource correctly" $ do
      let expectedResult = Program [ Resource [ Word "MyExampleBucket", Keyword S3 ]]
        
      let result = lexe "// this is a comment\nMyExampleBucket S3"
      result `shouldBe` expectedResult

  describe "symbols lexing" $ do
    it "an open brace is lexed into a OpenBrace symbol" $ do
      let expectedResult = Program [ Resource [ Word "S3Bucket", Keyword S3, Symbol OpenBrace ] ]
        
      let result = lexe "S3Bucket S3 {"
      result `shouldBe` expectedResult

    it "an closed brace is lexed into a ClosedBrace symbol" $ do
      let expectedResult = Program [ Resource [ Word "S3Bucket", Keyword S3, Symbol ClosedBrace ] ]
        
      let result = lexe "S3Bucket S3 }"
      result `shouldBe` expectedResult