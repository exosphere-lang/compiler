module Parser where

import qualified AST as AST
import CFError
import Grammar

parse :: Program -> [Either CFError AST.Resource]
parse p = map createResourceCFTree $ map getTokens $ getResources $ p 

createResourceCFTree :: [Token] -> Either CFError AST.Resource
createResourceCFTree (Word resourceName:Keyword serviceType:_) =  Right $ AST.Resource resourceName serviceType
createResourceCFTree (Word resourceName:[]) = Left $ InvalidResource "No resource type specified"
createResourceCFTree (Keyword serviceType:Word resourceName:_) = Left $ InvalidResource "Resource type should come after resource name"