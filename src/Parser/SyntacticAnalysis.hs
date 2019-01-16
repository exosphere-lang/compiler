module Parser.SyntacticAnalysis where

import Parser.AST
import Parser.ParseError.Errors
import Lexer.Grammar hiding (Resource)
import Data.Either

analyse :: Program -> Either [ParseError] AST
analyse (Program []) = Left [EmptyProgram]
analyse program = do
    let analysedTokens = map analyseLexedTokens $ map getTokens $ getResources $ program
    let errors = lefts analysedTokens

    case errors of
        ([]) -> Right $ AST (rights analysedTokens)
        _  -> Left $ errors

analyseLexedTokens :: [Token] -> Either ParseError Resource
analyseLexedTokens (Word resourceName:Keyword serviceType:_) =  Right $ Resource resourceName serviceType
analyseLexedTokens tokens = Left $ handleInvalidSyntax tokens 

handleInvalidSyntax :: [Token] -> ParseError
handleInvalidSyntax [] = EmptyProgram
handleInvalidSyntax (Word _:[]) = NoResourceTypeSpecified
handleInvalidSyntax (Keyword _:_) = ResourceTypeShouldComeAfterResourceName
handleInvalidSyntax (Word _: Word _:_) = ResourceNameShouldComeBeforeResourceType
handleInvalidSyntax (_) = FatalError
