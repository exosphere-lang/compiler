{-# LANGUAGE DeriveGeneric #-}

module ServiceType where

import Data.Aeson
import GHC.Generics

data ServiceType 
    = S3
    | ECSCluster
    | ApiGatewayAccount
    | ApiGatewayApiKey
    | ApiGatewayClientCertificate
    | ApiGatewayRestApi
    | ApiGatewayUsagePlan
    | AppStreamStack
    | AppSyncApiKey
    deriving (Eq, Generic)
 
instance Show ServiceType where
    show S3                          = "AWS::S3::Bucket"
    show ECSCluster                  = "AWS::ECS::Cluster"
    show ApiGatewayAccount           = "AWS::ApiGateway::Account"
    show ApiGatewayApiKey            = "AWS::ApiGateway::ApiKey"
    show ApiGatewayClientCertificate = "AWS::ApiGateway::ClientCertificate"
    show ApiGatewayRestApi           = "AWS::ApiGateway::RestApi"
    show ApiGatewayUsagePlan         = "AWS::ApiGateway::UsagePlan"
    show AppStreamStack              = "AWS::AppStream::Stack"
    show AppSyncApiKey               = "AWS::AppSync::ApiKey"

instance ToJSON ServiceType
