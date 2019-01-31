{-# LANGUAGE OverloadedStrings #-}

module Lexer.Lexer where

import qualified Data.Map.Strict          as Map
import           Data.Set
import qualified Lexer.Grammar            as Grammar
import           Lexer.Keywords
import qualified Parser.ParseError.Errors as PE
import           Prelude                  hiding (lookup)
import           Text.Megaparsec
import           Text.Megaparsec.Char

type Parser      = Parsec PE.ParseError String
type CustomError = ParseError (Token String) PE.ParseError

lexe :: String -> Either CustomError Grammar.Program
lexe programInput = parse parser "" programInput

parser :: Parser Grammar.Program 
parser = do
  resourceName <- many alphaNumChar
  space
  resourceTypePosition <- many alphaNumChar
  resourceType         <- validateResourceType resourceTypePosition

  return $ Grammar.Program [ Grammar.Resource [ Grammar.Word resourceName, resourceType ] ]

validateResourceType :: String -> Parser Grammar.Token
validateResourceType resourceType = do
  case Map.lookup resourceType keywords of 
    Nothing          -> fancyFailure $ singleton $ ErrorCustom PE.NoResourceTypeSpecified
    Just serviceType -> return serviceType
