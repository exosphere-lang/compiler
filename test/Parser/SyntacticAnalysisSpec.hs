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
    describe "resources parsing" $ do
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
        let expectedResult = AST [ Resource "MyExampleBucket" S3 [] ]

        let (Right result) = analyse "MyExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns an InvalidServiceTypeSpecified error when given S3 MyExampleBucket" $ do
        let expectedResult = "1:19:\n" ++ show InvalidServiceTypeSpecified ++ "\n"

        let (Left result) = analyse "S3 MyExampleBucket"
        (parseErrorPretty result) `shouldBe` expectedResult

      it "turns an arbitary number of Keywords and Words into multiple AST resources" $ do
        let expectedResult = AST [ Resource "MyExampleBucket" S3 [], Resource "MyOtherExampleBucket" S3 [] ]

        let (Right result) = analyse "MyExampleBucket S3 MyOtherExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns a AST with a single resource when given a single resource with a trailing carriage return" $ do
        let expectedResult =  AST [ Resource "MyExampleBucket" S3 [] ]
          
        let (Right result) = analyse "MyExampleBucket S3\n"
        result `shouldBe` expectedResult

    describe "comments parsing" $ do
      it "returns an unexpected end of input when given only a single comment" $ do
        let expectedResult = "2:1:\nunexpected end of input\nexpecting \"//\" or alphanumeric character\n"

        let (Left result) = analyse "// this is a comment\n"
        parseErrorPretty result `shouldBe` expectedResult

      it "returns a AST when given a single comment on the line above the exo code" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 [] ]

        let (Right result) = analyse "// this is a comment\nExampleBucket S3"
        result `shouldBe` expectedResult

      it "returns a AST when given a single comment on the line below the exo code" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 [] ]

        let (Right result) = analyse "ExampleBucket S3\n// this is a comment"
        result `shouldBe` expectedResult

      it "returns a AST when given a single comment on the line below the exo code with an end of line" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 [] ]

        let (Right result) = analyse "ExampleBucket S3\n// this is a comment\n"
        result `shouldBe` expectedResult

      it "returns a AST when given two comments on the line below the exo code" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 [] ]

        let (Right result) = analyse "ExampleBucket S3\n// this is a comment\n// this is a comment"
        result `shouldBe` expectedResult

      it "returns a AST when given two comments on the line above the exo code" $ do
        let expectedResult =  AST [ Resource "ExampleBucket" S3 [] ]

        let (Right result) = analyse "// this is a comment\n// this is a comment\nExampleBucket S3"
        result `shouldBe` expectedResult

    describe "properties parsing" $ do
      describe "no properties" $ do
        it "parses property of {} correctly to the Property type, []" $ do
          let expectedResult = AST [ Resource "ExampleBucket" S3 [] ]

          let (Right result) = analyse "ExampleBucket S3 {}"
          result `shouldBe` expectedResult

      describe "single property" $ do
        it "parses property of {AccessControl Private} correctly to the Property type" $ do
          let expectedResult = AST [ Resource "ExampleBucket" S3 [ Property "AccessControl" "Private" ] ]

          let (Right result) = analyse "ExampleBucket S3 {AccessControl Private}"
          result `shouldBe` expectedResult

        it "parses property of { AccessControl Private } (with spaces) correctly to the Property type" $ do
          let expectedResult = AST [ Resource "ExampleBucket" S3 [ Property "AccessControl" "Private" ] ]

          let (Right result) = analyse "ExampleBucket S3 { AccessControl Private }"
          result `shouldBe` expectedResult

        it "parses property of {   AccessControl Private   } (with multiple spaces) correctly to the Property type" $ do
          let expectedResult = AST [ Resource "ExampleBucket" S3 [ Property "AccessControl" "Private" ] ]

          let (Right result) = analyse "ExampleBucket S3 {   AccessControl Private   }"
          result `shouldBe` expectedResult

      describe "multiple properties" $ do
        it "parses property of {AccessControl Private,AvailabilityZone Ireland} correctly to the Property type" $ do
          let expectedResult = AST [ Resource "ExampleBucket" S3 [ Property "AccessControl" "Private", Property "AvailabilityZone" "Ireland"] ]

          let (Right result) = analyse "ExampleBucket S3 {AccessControl Private,AvailabilityZone Ireland}"
          result `shouldBe` expectedResult
