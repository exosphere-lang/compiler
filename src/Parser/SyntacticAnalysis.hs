{-# LANGUAGE OverloadedStrings #-}

module Parser.SyntacticAnalysis where

import qualified Data.Map.Strict            as Map
import           Data.Set  
import           Parser.Keywords  
import qualified Parser.AST                 as AST
import           Parser.CustomError
import qualified Parser.ParseError.Errors   as PE
import           Prelude                    hiding (lookup)
import           ServiceType                (ServiceType)
import           Text.Megaparsec
import           Text.Megaparsec.Char
import           Text.Megaparsec.Char.Lexer hiding (space)
import qualified Data.Map.Strict as Map

type Parser = Parsec PE.ParseError String

analyse :: String -> Either CustomError AST.AST
analyse programInput = parse parser "" programInput

parser :: Parser AST.AST
parser = do
  resources <- some getResourceIgnoringComments

  return $ AST.AST resources 

getResourceIgnoringComments :: Parser AST.Resource
getResourceIgnoringComments = do
  _ <- many (comment *> eol)
  r <- resource
  _ <- many comment

  return r

comment :: Parser ()
comment = skipLineComment "//"

resource :: Parser AST.Resource
resource = do
  resourceNamePattern <- some alphaNumChar
  space1
  serviceTypePattern  <- some alphaNumChar
  space
  propertiesPattern <- single properties

  serviceType <- serviceTypeOrFail serviceTypePattern
  return $ AST.Resource resourceNamePattern serviceType

properties = do
  char '{'
  space
  properties <- many keyValue
  space
  char '}'
  return properties

keyValue = do
    propertiesKey <- some alphaNumChar
    space1
    propertiesValue <- some alphaNumChar
    return (propertiesKey, propertiesValue)

serviceTypeOrFail :: String -> Parser ServiceType
serviceTypeOrFail serviceType = do
  case Map.lookup serviceType keywordsMap of 
    Nothing -> fancyFailure $ singleton $ ErrorCustom PE.InvalidServiceTypeSpecified
    Just st -> return st

validatePropertyOrFail :: (String, String) -> Parser String
validatePropertyOrFail (key, value) =   
  case Map.lookup key propertiesMap of 
    Nothing -> fancyFailure $ singleton $ ErrorCustom PE.InvalidServiceTypeSpecified
    Just values -> if value `elem` values then return value else undefined

propertiesMap :: Map.Map String [String]
propertiesMap = Map.fromList
  [
    ("AccessControl", ["Private", "Public"])
  ]
