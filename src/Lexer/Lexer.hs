{-# LANGUAGE OverloadedStrings #-}

module Lexer.Lexer where

import Control.Monad                      (void)
import qualified Data.Map.Strict          as Map
import           Data.Set
import qualified Lexer.Grammar            as Grammar
import           Lexer.Keywords
import qualified Parser.ParseError.Errors as PE
import           Prelude                  hiding (lookup)
import           Text.Megaparsec
import           Text.Megaparsec.Char
import           Text.Megaparsec.Char.Lexer hiding (space)

type Parser      = Parsec PE.ParseError String
type CustomError = ParseError (Token String) PE.ParseError

lexe :: String -> Either CustomError Grammar.Program
lexe programInput = parse parser "" programInput

parser :: Parser Grammar.Program 
parser = do
  resources <- some getResourceIgnoringComments

  return $ Grammar.Program resources 

getResourceIgnoringComments :: Parser Grammar.Resource
getResourceIgnoringComments = do
  _ <- many (comment *> eol)

  r <- resource
  return r

comment :: Parser ()
comment = skipLineComment "//"

resource :: Parser Grammar.Resource
resource = do
  resourceNamePattern <- some alphaNumChar
  space1
  resourceTypePattern <- some alphaNumChar
  space

  resourceType         <- resourceTypeOrFail resourceTypePattern
  return $ Grammar.Resource [ Grammar.Word resourceNamePattern, resourceType ]

resourceTypeOrFail :: String -> Parser Grammar.Token
resourceTypeOrFail resourceType = do
  case Map.lookup resourceType keywords of 
    Nothing          -> fancyFailure $ singleton $ ErrorCustom PE.InvalidResourceTypeSpecified
    Just serviceType -> return serviceType
