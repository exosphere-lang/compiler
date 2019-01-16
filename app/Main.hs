module Main where

import Lexer.Lexer
import Parser.Parse (parse)

main :: IO ()
main = do
    fileContents <- readFile "/home/chrisb/exosphere/examples/S3/MinimalS3Bucket.exo"
    print $ (parse . lexe) $ fileContents
