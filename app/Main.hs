module Main where

import Lexer

main :: IO ()
main = do
    fileContents <- readFile "examples/SingleS3Bucket.exo"
    print $ lexe fileContents
