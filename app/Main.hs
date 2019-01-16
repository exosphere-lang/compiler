module Main where

import Lexer.Lexer
import Parser.Parse       (parse)
import System.Environment (getArgs)

main :: IO ()
main = do
    (file:_) <- getArgs
    fileContents <- readFile file
    print $ (parse . lexe) $ fileContents
