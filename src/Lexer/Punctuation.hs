module Lexer.Punctuation where

import Data.Map
import Lexer.Grammar (Token(..), Punctuation(..))

punctuation :: Map String Token
punctuation = fromList
  [
    ("{", Symbol OpenBrace),
    ("}", Symbol ClosedBrace)
  ]
