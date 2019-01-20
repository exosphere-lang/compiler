module Lexer.Lexer where

import Prelude         hiding (lookup)
import Data.List.Split (splitOn)
import Data.Maybe      (fromMaybe)
import Data.Map        (lookup)
import Lexer.Grammar
import Lexer.Keywords

lexe :: String -> Program
lexe input = matchInputToProgram $  inputs
  where
    inputs = map (splitOn " ") $ splitOn "\n" (removeTrailingCarraigeReturn input)

removeTrailingCarraigeReturn :: String -> String
removeTrailingCarraigeReturn s
  | length s > 0 = if last s == '\n' then init s else s
  | otherwise    = s

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
