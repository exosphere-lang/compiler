module Parser.Parse where

import Lexer.Grammar
import Parser.SyntacticAnalysis (analyse)
import Parser.AST
import Parser.ParseError.Errors

parse :: Program -> Either [ParseError] AST
parse = analyse
