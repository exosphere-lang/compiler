module Lexer.Lexer where

import Data.List       (isPrefixOf)
import Data.List.Split (splitOn)
import Data.Map        (lookup)
import Data.Maybe      (fromMaybe)
import Lexer.Grammar
import Lexer.Keywords
import Prelude         hiding (lookup)

commentsSymbol :: String
commentsSymbol = "//"

lexe :: String -> Program
lexe input = matchInputToProgram $  inputs
  where
    inputs = map (splitOn " ") . removeComments $ splitOn "\n" (removeTrailingCarraigeReturnFromEndOfProgram input)

removeTrailingCarraigeReturnFromEndOfProgram :: String -> String
removeTrailingCarraigeReturnFromEndOfProgram s
  | length s > 0 = if last s == '\n' then init s else s
  | otherwise    = s

removeComments :: [String] -> [String]
removeComments = filter (\line -> not $ commentsSymbol `isPrefixOf` line)

matchInputToProgram :: [[String]] -> Program
matchInputToProgram input = Program $ map matchInputToResource input

matchInputToResource :: [String] -> Resource
matchInputToResource input = Resource $ map matchInputToToken input

matchInputToToken :: String -> Token
matchInputToToken input = do
  let res = lookup input keywords
  res `orElse` Word input

orElse :: Maybe a -> a -> a
orElse = flip fromMaybe
