module Main where

import CodeGen.Generate
import Data.Aeson         (encodeFile)
import Lexer.Lexer
import Parser.Parse       (parse)
import System.Environment (getArgs)

main :: IO ()
main = do
    print "bla"
    -- (file:_) <- getArgs
    -- fileContents <- readFile file
    -- let astOrErrors = parse . lexe $ fileContents
    -- case astOrErrors of
    --     Right ast -> do
    --         let outFile = file ++ ".json"
    --         encodeFile outFile $ generateCloudFormationFromAST $ ast
    --     Left errors -> print errors
