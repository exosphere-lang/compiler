{-# LANGUAGE OverloadedStrings #-}

module Lexer.Lexer where

import qualified Data.Map.Strict as Map
import           Data.Set
import qualified Lexer.Grammar as Grammar
import           Lexer.Keywords
import qualified Parser.ParseError.Errors as PE
import           Prelude hiding (lookup)
import           Text.Megaparsec
import           Text.Megaparsec.Char

commentsSymbol :: String
commentsSymbol = "//"

type Parser = Parsec PE.ParseError String

lexe :: String -> Either (ParseError (Token String) PE.ParseError) Grammar.Program
lexe programInput = parse parser "" programInput

parser :: Parser Grammar.Program 
parser = do
  resourceName <- many alphaNumChar
  space
  a <- many alphaNumChar

  resourceType <- resourceTypeParser a 

  return $ Grammar.Program [ Grammar.Resource [ Grammar.Word resourceName, resourceType ] ]

resourceTypeParser :: String -> Parser Grammar.Token
resourceTypeParser resourceType = do
  case Map.lookup resourceType keywords of 
    Nothing -> fancyFailure $ singleton $ ErrorCustom PE.NoResourceTypeSpecified
    Just serviceType -> return serviceType
