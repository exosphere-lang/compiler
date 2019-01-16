module Parser where

import qualified AST as AST
import ParseErrors
import Grammar

parse :: Program -> [Either ParseErrors AST.Resource]
parse (Program []) = [Left EmptyProgram]
parse p = map createResourceCFTree $ map getTokens $ getResources $ p

createResourceCFTree :: [Token] -> Either ParseErrors AST.Resource
createResourceCFTree [] = Left $ EmptyProgram
createResourceCFTree (Word resourceName:Keyword serviceType:_) =  Right $ AST.Resource resourceName serviceType
createResourceCFTree (Word _:[]) = Left $ InvalidResource "No resource type specified"
createResourceCFTree (Keyword _:_) = Left $ InvalidResource "Resource type should come after resource name"
createResourceCFTree (Word _: Word _:_) = Left $ InvalidResource "A resource type must be specified following a resource name"
