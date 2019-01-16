module LexerSpec (spec) where

import Lexer.Lexer
import Test.Hspec
import Lexer.Grammar
import ServiceType (ServiceType(..))

spec :: Spec
spec =
  describe "Lexer" $ do
    it "returns empty program if empty string is provided" $ do
      let expectedResult = Program [ Resource [ Word "" ] ]

      let result = lexe ""
      result `shouldBe` expectedResult

    it "returns CatPictures into a Token of Word with literal value CatPictures" $ do
      let expectedResult = Program [ Resource [ Word "CatPictures"] ]

      let result = lexe "CatPictures"
      result `shouldBe` expectedResult

    it "returns S3 into a Token of ServiceType of S3" $ do
        let expectedResult = Program [ Resource [Keyword S3] ]
  
        let result = lexe "S3"
        result `shouldBe` expectedResult

    it "returns CatPictures S3 into tokens of Word CatPictures and Keyword S3" $ do
      let expectedResult = Program [ Resource [Word "CatPictures", Keyword S3] ]

      let result = lexe "CatPictures S3"
      result `shouldBe` expectedResult

    it "returns S3 CatPictures into tokens of Keyword S3 and Word CatPictures" $ do
      let expectedResult = Program [ Resource [Keyword S3, Word "CatPictures"] ]

      let result = lexe "S3 CatPictures"
      result `shouldBe` expectedResult

    it "returns an arbitary number of Keywords and Words" $ do
      let expectedResult = Program [ Resource [Keyword S3, Word "CatPictures", Word "DogPictures", Keyword S3 ] ]

      let result = lexe "S3 CatPictures DogPictures S3"
      result `shouldBe` expectedResult

    it "returns a program with two resources and their respective keyword and word tokens" $ do
      let expectedResult = Program [ Resource [ Keyword S3, Word "CatPictures" ], Resource [ Keyword S3, Word "DogPictures" ] ]
        
      let result = lexe "S3 CatPictures\nS3 DogPictures"
      result `shouldBe` expectedResult

    it "returns a program with a single resources and its respective keyword and word tokens when the input has a trailing carriage return" $ do
      let expectedResult = Program [ Resource [ Keyword S3, Word "CatPictures" ] ]
        
      let result = lexe "S3 CatPictures\n"
      result `shouldBe` expectedResult
