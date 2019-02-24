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
  | AWSAmazonMQBroker
  | AWSAmazonMQConfiguration
  | AWSAmazonMQConfigurationAssociation
  | AWSApiGatewayAuthorizer
  | AWSApiGatewayBasePathMapping
  | AWSApiGatewayDeployment
  | AWSApiGatewayDocumentationPart
  | AWSApiGatewayDocumentationVersion
  | AWSApiGatewayDomainName
  | AWSApiGatewayGatewayResponse
  | AWSApiGatewayMethod
  | AWSApiGatewayModel
  | AWSApiGatewayRequestValidator
  | AWSApiGatewayResource
  | AWSApiGatewayStage
  | AWSApiGatewayUsagePlanKey
  | AWSApiGatewayVpcLink
  | AWSApplicationAutoScalingScalableTarget
  | AWSApplicationAutoScalingScalingPolicy
  | AWSAppStreamDirectoryConfig
  | AWSAppStreamUser
  | AWSAppStreamStackUserAssociation
  | AWSAppStreamStackFleetAssociation
  | AWSAppStreamImageBuilder
  | AWSAppStreamFleet
  | AWSAppSyncDataSource
  | AWSAppSyncFunctionConfiguration
  | AWSAppSyncGraphQLApi
  | AWSAppSyncGraphQLSchema
  | AWSAppSyncResolver
  | AWSAthenaNamedQuery
  | AWSAutoScalingPlansScalingPlan
  | AWSAutoScalingScheduledAction
  | AWSAutoScalingScalingPolicy
  | AWSAutoScalingLifecycleHook
  | AWSAutoScalingLaunchConfiguration
  | AWSAutoScalingAutoScalingGroup
  | AWSBatchJobQueue
  | AWSBatchJobDefinition
  | AWSBatchComputeEnvironment
  | AWSBudgetsBudget
  | AWSCertificateManagerCertificate
  | AWSCloud9EnvironmentEC2
  deriving (Eq, Generic)
 
instance Show ServiceType where
  show S3                                      = "AWS::S3::Bucket"
  show ECSCluster                              = "AWS::ECS::Cluster"
  show ApiGatewayAccount                       = "AWS::ApiGateway::Account"
  show ApiGatewayApiKey                        = "AWS::ApiGateway::ApiKey"
  show ApiGatewayClientCertificate             = "AWS::ApiGateway::ClientCertificate"
  show ApiGatewayRestApi                       = "AWS::ApiGateway::RestApi"
  show ApiGatewayUsagePlan                     = "AWS::ApiGateway::UsagePlan"
  show AppStreamStack                          = "AWS::AppStream::Stack"
  show AppSyncApiKey                           = "AWS::AppSync::ApiKey"
  show AlexaASKSkill                           = "Alexa::ASK::Skill"
  show AWSAmazonMQBroker                       = "AWS::AmazonMQ::Broker"
  show AWSAmazonMQConfiguration                = "AWS::AmazonMQ::Configuration"
  show AWSAmazonMQConfigurationAssociation     = "AWS::AmazonMQ::ConfigurationAssociation"
  show AWSApiGatewayAuthorizer                 = "AWS::ApiGateway::Authorizer"
  show AWSApiGatewayBasePathMapping            = "AWS::ApiGateway::BasePathMapping"
  show AWSApiGatewayDeployment                 = "AWS::ApiGateway::Deployment"
  show AWSApiGatewayDocumentationPart          = "AWS::ApiGateway::DocumentationPart"
  show AWSApiGatewayDocumentationVersion       = "AWS::ApiGateway::DocumentationVersion"
  show AWSApiGatewayDomainName                 = "AWS::ApiGateway::DomainName"
  show AWSApiGatewayGatewayResponse            = "AWS::ApiGateway::GatewayResponse"
  show AWSApiGatewayMethod                     = "AWS::ApiGateway::Method"
  show AWSApiGatewayModel                      = "AWS::ApiGateway::Model"
  show AWSApiGatewayRequestValidator           = "AWS::ApiGateway::RequestValidator"
  show AWSApiGatewayResource                   = "AWS::ApiGateway::Resource"
  show AWSApiGatewayStage                      = "AWS::ApiGateway::Stage"
  show AWSApiGatewayUsagePlanKey               = "AWS::ApiGateway::UsagePlanKey"
  show AWSApiGatewayVpcLink                    = "AWS::ApiGateway::VpcLink"
  show AWSApplicationAutoScalingScalableTarget = "AWS::ApplicationAutoScaling::ScalableTarget"
  show AWSApplicationAutoScalingScalingPolicy  = "AWS::ApplicationAutoScaling::ScalingPolicy"
  show AWSAppStreamDirectoryConfig             = "AWS::AppStream::DirectoryConfig"
  show AWSAppStreamUser                        = "AWS::AppStream::User"
  show AWSAppStreamStackUserAssociation        = "AWS::AppStream::StackUserAssociation"
  show AWSAppStreamStackFleetAssociation       = "AWS::AppStream::StackFleetAssociation"
  show AWSAppStreamImageBuilder                = "AWS::AppStream::ImageBuilder"
  show AWSAppStreamFleet                       = "AWS::AppStream::Fleet"
  show AWSAppSyncDataSource                    = "AWS::AppSync::DataSource"
  show AWSAppSyncFunctionConfiguration         = "AWS::AppSync::FunctionConfiguration"
  show AWSAppSyncGraphQLApi                    = "AWS::AppSync::GraphQLApi"
  show AWSAppSyncGraphQLSchema                 = "AWS::AppSync::GraphQLSchema"
  show AWSAppSyncResolver                      = "AWS::AppSync::Resolver"
  show AWSAthenaNamedQuery                     = "AWS::Athena::NamedQuery"
  show AWSAutoScalingPlansScalingPlan          = "AWS::AutoScalingPlans::ScalingPlan"
  show AWSAutoScalingScheduledAction           = "AWS::AutoScaling::ScheduledAction"
  show AWSAutoScalingScalingPolicy             = "AWS::AutoScaling::ScalingPolicy"
  show AWSAutoScalingLifecycleHook             = "AWS::AutoScaling::LifecycleHook"
  show AWSAutoScalingLaunchConfiguration       = "AWS::AutoScaling::LaunchConfiguration"
  show AWSAutoScalingAutoScalingGroup          = "AWS::AutoScaling::AutoScalingGroup"
  show AWSBatchJobQueue                        = "AWS::Batch::JobQueue"
  show AWSBatchJobDefinition                   = "AWS::Batch::JobDefinition"
  show AWSBatchComputeEnvironment              = "AWS::Batch::ComputeEnvironment"
  show AWSBudgetsBudget                        = "AWS::Budgets::Budget"
  show AWSCertificateManagerCertificate        = "AWS::CertificateManager::Certificate"
  show AWSCloud9EnvironmentEC2                 = "AWS::Cloud9::EnvironmentEC2"

instance ToJSON ServiceType
