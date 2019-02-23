{-# LANGUAGE OverloadedStrings #-}

module Parser.SyntacticAnalysis where

import qualified Data.Map.Strict as Map
import           Data.Set  
import qualified Parser.AST                 as AST  
import           Parser.CustomError
import           Parser.Keywords
import qualified Parser.ParseError.Errors   as PE
import           Prelude                    hiding (lookup)
import           ServiceType                (ServiceType)
import           Text.Megaparsec
import           Text.Megaparsec.Char
import           Text.Megaparsec.Char.Lexer hiding (space)

type Parser = Parsec PE.ParseError String

analyse :: String -> Either CustomError AST.AST
analyse programInput = parse parser "" programInput

parser :: Parser AST.AST
parser = 
  some getResourceIgnoringComments >>=
    \resources -> return $ AST.AST resources 

getResourceIgnoringComments :: Parser AST.Resource
getResourceIgnoringComments = do
  _ <- many (comment *> eol)
  r <- resource
  _ <- many comment
  return r

resource :: Parser AST.Resource
resource = do
  resourceNamePattern <- some alphaNumChar
  space1
  serviceTypePattern  <- some alphaNumChar
  space
  propertiesPattern <- withRecovery defaultProperty properties

  serviceType <- toServiceTypeOrFail serviceTypePattern
  return $ AST.Resource resourceNamePattern serviceType propertiesPattern

-- TODO: Find a better way of doing this
-- because this means that any errors in the properties parsing will be ignored
defaultProperty :: a -> Parser [AST.Property]
defaultProperty _ = return []

properties :: Parser [AST.Property]
properties = do
  _ <- char '{'
  space
  props <- many keyValue
  space
  _ <- char '}'
  return props

keyValue :: Parser AST.Property
keyValue = do
  propertiesKey <- some alphaNumChar
  space1
  propertiesValue <- some alphaNumChar
  _ <- many $ char ','
  return $ AST.Property propertiesKey propertiesValue

comment :: Parser ()
comment = skipLineComment "//"

toServiceTypeOrFail :: String -> Parser ServiceType
toServiceTypeOrFail serviceType = do
  case Map.lookup serviceType keywordsMap of 
    Nothing -> fancyFailure $ singleton $ ErrorCustom PE.InvalidServiceTypeSpecified
    Just st -> return st

-- TODO: Add to resource parser above
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
