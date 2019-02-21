{-# LANGUAGE LambdaCase #-}

module Main where

import CodeGen.Generate
import Data.Aeson         (encodeFile)
import Parser.AST
import Parser.CustomError
import Parser.Parse       (parse)
import System.Environment (getArgs)

main :: IO ()
main = do
  getArgs >>= \case
    [fileName] -> readFile fileName >>= runAST fileName . parse
    _ -> putStrLn help

runAST :: FilePath -> Either CustomError AST -> IO ()
runAST _        (Left errors) = print errors
runAST fileName (Right ast)   = encodeFile (fileName ++ ".json") . generateCloudFormationFromAST $ ast

help :: String
help = "Expected format: exospherec <file.exo>"
