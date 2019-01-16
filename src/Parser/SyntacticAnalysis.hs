module Parser.SyntacticAnalysis where

import Parser.AST
import Parser.ParseError.Errors
import Lexer.Grammar hiding (Resource)
import Data.Either

analyse :: Program -> Either [ParseError] AST
analyse (Program []) = Left [EmptyProgram]
analyse program = do
    let analysedResources = analyseLexedTokens <$> getTokensToAnalyse program
    let errors            = lefts analysedResources

    case errors of
        ([]) -> Right $ AST (rights analysedResources)
        _    -> Left $ errors

getTokensToAnalyse :: Program -> [[Token]]
getTokensToAnalyse program = map getResourceTokens $ getProgramResources $ program

analyseLexedTokens :: [Token] -> Either ParseError Resource
analyseLexedTokens (Word resourceName:Keyword serviceType:_) =  Right $ Resource resourceName serviceType
analyseLexedTokens tokens = Left $ handleInvalidSyntax tokens 

handleInvalidSyntax :: [Token] -> ParseError
handleInvalidSyntax []                 = EmptyProgram
handleInvalidSyntax (Word _:[])        = NoResourceTypeSpecified
handleInvalidSyntax (Keyword _:_)      = ResourceTypeShouldComeAfterResourceName
handleInvalidSyntax (Word _: Word _:_) = ResourceNameShouldComeBeforeResourceType
handleInvalidSyntax (_)                = FatalError
