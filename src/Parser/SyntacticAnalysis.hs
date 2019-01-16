module Parser.SyntacticAnalysis where

import qualified AST as AST
import Parser.Errors
import Lexer.Grammar

analyse :: Program -> [Either ParseErrors AST.Resource]
analyse (Program []) = [Left EmptyProgram]
analyse p = map analyseLexedTokens $ map getTokens $ getResources $ p

analyseLexedTokens :: [Token] -> Either ParseErrors AST.Resource
analyseLexedTokens (Word resourceName:Keyword serviceType:_) =  Right $ AST.Resource resourceName serviceType
analyseLexedTokens tokens = Left $ handleInvalidSyntax tokens

handleInvalidSyntax :: [Token] -> ParseErrors
handleInvalidSyntax [] = EmptyProgram
handleInvalidSyntax (Word _:[]) = InvalidResource "No resource type specified"
handleInvalidSyntax (Keyword _:_) = InvalidResource "Resource type should come after resource name"
handleInvalidSyntax (Word _: Word _:_) = InvalidResource "A resource type must be specified following a resource name"
