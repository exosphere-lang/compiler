module Parser.Keywords where

import Data.Map
import ServiceType (ServiceType(..))
import ServiceTypes.S3

keywordsMap :: Map String ServiceType
keywordsMap = fromList
  [
    ("S3", ServiceType $ S3 "AWS::S3::Bucket" Nothing)
  ]
