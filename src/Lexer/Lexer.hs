module Lexer.Lexer where

import Lexer.Grammar
import Text.Megaparsec
import Text.Megaparsec.Char
import Data.Void
import qualified Text.Megaparsec.Char.Lexer as Lex

commentsSymbol :: String
commentsSymbol = "//"

-- test undefined error type?
lexe :: String -> Program
lexe programInput = either undefined id $ parse parser "" programInput

parser :: Parser Program 
parser = do
  resourceName <- many alphaNumChar
  return $ Program [ Resource [ Word resourceName ] ]

type Parser = Parsec Void String