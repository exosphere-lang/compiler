module Main where

import Lexer.Lexer
import Parser.Parse       (parse)
import System.Environment (getArgs)
import Data.Aeson (encode, encodeFile)
import CodeGen.Generate

main :: IO ()
main = do
    (file:_) <- getArgs
    fileContents <- readFile file
    let astOrErrors = parse . lexe $ fileContents
    case astOrErrors of
        Right ast -> do
            let outFile = file ++ ".json"
            encodeFile outFile $ generateCloudFormationFromAST $ ast
        Left errors -> print errors
