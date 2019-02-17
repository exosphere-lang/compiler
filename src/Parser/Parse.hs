module Parser.Parse where

import qualified Parser.AST               as AST
import           Parser.CustomError
import           Parser.SyntacticAnalysis (analyse)

parse :: String -> Either CustomError AST.AST
parse = analyse
