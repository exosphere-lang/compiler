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
  return r

comment :: Parser ()
comment = skipLineComment "//"

resource :: Parser AST.Resource
resource = do
  resourceNamePattern <- some alphaNumChar
  space1
  serviceTypePattern  <- some alphaNumChar
  space

  serviceType <- serviceTypeOrFail serviceTypePattern
  return $ AST.Resource resourceNamePattern serviceType

serviceTypeOrFail :: String -> Parser ServiceType
serviceTypeOrFail serviceType = do
  case Map.lookup serviceType keywordsMap of 
    Nothing -> fancyFailure $ singleton $ ErrorCustom PE.InvalidServiceTypeSpecified
    Just st -> return st
