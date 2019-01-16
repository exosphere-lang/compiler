module Parser.Errors where

data ParseErrors 
  = InvalidSyntax String 
  | InvalidResource String
  | EmptyProgram
  deriving (Eq, Show)
