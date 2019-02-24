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
  | AlexaASKSkill
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
  
  show AlexaASKSkill               = "Alexa::ASK::Skill"
  show x               = "AWS::AmazonMQ::Broker"
  show x               = "AWS::AmazonMQ::Configuration"
  show x               = "AWS::AmazonMQ::ConfigurationAssociation"
  show x               = "AWS::ApiGateway::Authorizer"
  show x               = "AWS::ApiGateway::BasePathMapping"
  show x               = "AWS::ApiGateway::Deployment"
  show x               = "AWS::ApiGateway::DocumentationPart"
  show x               = "AWS::ApiGateway::DocumentationVersion"
  show x               = "AWS::ApiGateway::DomainName"
  show x               = "AWS::ApiGateway::GatewayResponse"
  show x               = "AWS::ApiGateway::Method"
  show x               = "AWS::ApiGateway::Model"
  show x               = "AWS::ApiGateway::RequestValidator"
  show x               = "AWS::ApiGateway::Resource"
  show x               = "AWS::ApiGateway::Stage"
  show x               = "AWS::ApiGateway::UsagePlanKey"
  show x               = "AWS::ApiGateway::VpcLink"

instance ToJSON ServiceType
