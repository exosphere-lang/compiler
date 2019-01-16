module ServiceType where

data ServiceType = S3 deriving (Eq)

instance Show ServiceType where
    show S3 = "AWS::S3::Bucket"
