module Parser.CustomError where

import qualified Parser.ParseError.Errors   as PE
import           Text.Megaparsec

type CustomError = ParseError (Token String) PE.ParseError
