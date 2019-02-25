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
  | AWSCloudFormationAuthentication
  | AWSCloudFormationCustomResource
  | AWSCloudFormationInit
  | AWSCloudFormationInterface
  | AWSCloudFormationMacro
  | AWSCloudFormationStack
  | AWSCloudFormationWaitCondition
  | AWSCloudFormationWaitConditionHandle
  | AWSCloudFrontDistribution
  | AWSCloudFrontCloudFrontOriginAccessIdentity
  | AWSCloudFrontStreamingDistribution
  | AWSServiceDiscoveryInstance
  | AWSServiceDiscoveryHttpNamespace
  | AWSServiceDiscoveryPrivateDnsNamespace
  | AWSServiceDiscoveryPublicDnsNamespace
  | AWSServiceDiscoveryService
  | AWSCloudTrailTrail
  | AWSCloudWatchAlarm
  | AWSCloudWatchDashboard
  | AWSEventsRule
  | AWSEventsEventBusPolicy
  | AWSLogsDestination
  | AWSLogsLogGroup
  | AWSLogsLogStream
  | AWSLogsMetricFilter
  | AWSLogsSubscriptionFilter
  | AWSCodeBuildProject
  | AWSCodeCommitRepository
  | AWSCodeDeployApplication
  | AWSCodeDeployDeploymentConfig
  | AWSCodeDeployDeploymentGroup
  | AWSCodePipelineCustomActionType
  | AWSCodePipelinePipeline
  | AWSCodePipelineWebhook
  | AWSCognitoIdentityPool
  | AWSCognitoIdentityPoolRoleAttachment
  | AWSCognitoUserPool
  | AWSCognitoUserPoolClient
  | AWSCognitoUserPoolGroup
  | AWSCognitoUserPoolUser
  | AWSCognitoUserPoolUserToGroupAttachment
  | AWSConfigAggregationAuthorization
  | AWSConfigConfigRule
  | AWSConfigConfigurationAggregator
  | AWSConfigConfigurationRecorder
  | AWSConfigDeliveryChannel
  | AWSDataPipelinePipeline
  | AWSDAXCluster
  | AWSDAXParameterGroup
  | AWSDAXSubnetGroup
  | AWSDirectoryServiceMicrosoftAD
  | AWSDirectoryServiceSimpleAD
  | AWSDLMLifecyclePolicy
  | AWSDMSCertificate
  | AWSDMSEndpoint
  | AWSDMSEventSubscription
  | AWSDMSReplicationInstance
  | AWSDMSReplicationSubnetGroup
  | AWSDMSReplicationTask
  | AWSDocDBDBCluster
  | AWSDocDBDBClusterParameterGroup
  | AWSDocDBDBInstance
  | AWSDocDBDBSubnetGroup
  | AWSDynamoDBTable
  | AWSEC2CustomerGateway
  | AWSEC2DHCPOptions
  | AWSEC2EC2Fleet
  | AWSEC2EgressOnlyInternetGateway
  | AWSEC2EIP
  | AWSEC2EIPAssociation
  | AWSEC2FlowLog
  | AWSEC2Host
  | AWSEC2Instance
  | AWSEC2InternetGateway
  | AWSEC2LaunchTemplate
  | AWSEC2NatGateway
  | AWSEC2NetworkAcl
  | AWSEC2NetworkAclEntry
  | AWSEC2NetworkInterface
  | AWSEC2NetworkInterfaceAttachment
  | AWSEC2NetworkInterfacePermission
  | AWSEC2PlacementGroup
  | AWSEC2Route
  | AWSEC2RouteTable
  | AWSEC2SecurityGroup
  | AWSEC2SecurityGroupEgress
  | AWSEC2SecurityGroupIngress
  | AWSEC2SpotFleet
  | AWSEC2Subnet
  | AWSEC2SubnetCidrBlock
  | AWSEC2SubnetNetworkAclAssociation
  | AWSEC2SubnetRouteTableAssociation
  | AWSEC2TransitGateway
  | AWSEC2TransitGatewayAttachment
  | AWSEC2TransitGatewayRoute
  | AWSEC2TransitGatewayRouteTable
  | AWSEC2TransitGatewayRouteTableAssociation
  | AWSEC2TransitGatewayRouteTablePropagation
  | AWSEC2Volume
  | AWSEC2VolumeAttachment
  | AWSEC2VPC
  | AWSEC2VPCCidrBlock
  | AWSEC2VPCDHCPOptionsAssociation
  | AWSEC2VPCEndpoint
  | AWSEC2VPCEndpointConnectionNotification
  | AWSEC2VPCEndpointService
  | AWSEC2VPCEndpointServicePermissions
  | AWSEC2VPCGatewayAttachment
  | AWSEC2VPCPeeringConnection
  | AWSEC2VPNConnection
  | AWSEC2VPNConnectionRoute
  | AWSEC2VPNGateway
  | AWSEC2VPNGatewayRoutePropagation
  | AWSECRRepository
  | AWSEFSFileSystem
  | AWSEFSMountTarget
  | AWSEKSCluster
  | AWSElastiCacheCacheCluster
  | AWSElastiCacheParameterGroup
  | AWSElastiCacheReplicationGroup
  | AWSElastiCacheSecurityGroup
  | AWSElastiCacheSecurityGroupIngress
  | AWSElastiCacheSubnetGroup
  | AWSElasticsearchDomain
  | AWSElasticBeanstalkApplication
  | AWSElasticBeanstalkApplicationVersion
  | AWSElasticBeanstalkConfigurationTemplate
  | AWSElasticBeanstalkEnvironment
  | AWSElasticLoadBalancingLoadBalancer
  | AWSElasticLoadBalancingV2Listener
  | AWSElasticLoadBalancingV2ListenerCertificate
  | AWSElasticLoadBalancingV2ListenerRule
  | AWSElasticLoadBalancingV2LoadBalancer
  | AWSElasticLoadBalancingV2TargetGroup
  | AWSEMRCluster
  | AWSEMRInstanceFleetConfig
  | AWSEMRInstanceGroupConfig
  | AWSEMRSecurityConfiguration
  | AWSEMRStep
  deriving (Eq, Generic)
 
instance Show ServiceType where
  show S3                                           = "AWS::S3::Bucket"
  show ECSCluster                                   = "AWS::ECS::Cluster"
  show ApiGatewayAccount                            = "AWS::ApiGateway::Account"
  show ApiGatewayApiKey                             = "AWS::ApiGateway::ApiKey"
  show ApiGatewayClientCertificate                  = "AWS::ApiGateway::ClientCertificate"
  show ApiGatewayRestApi                            = "AWS::ApiGateway::RestApi"
  show ApiGatewayUsagePlan                          = "AWS::ApiGateway::UsagePlan"
  show AppStreamStack                               = "AWS::AppStream::Stack"
  show AppSyncApiKey                                = "AWS::AppSync::ApiKey"
  show AlexaASKSkill                                = "Alexa::ASK::Skill"
  show AWSAmazonMQBroker                            = "AWS::AmazonMQ::Broker"
  show AWSAmazonMQConfiguration                     = "AWS::AmazonMQ::Configuration"
  show AWSAmazonMQConfigurationAssociation          = "AWS::AmazonMQ::ConfigurationAssociation"
  show AWSApiGatewayAuthorizer                      = "AWS::ApiGateway::Authorizer"
  show AWSApiGatewayBasePathMapping                 = "AWS::ApiGateway::BasePathMapping"
  show AWSApiGatewayDeployment                      = "AWS::ApiGateway::Deployment"
  show AWSApiGatewayDocumentationPart               = "AWS::ApiGateway::DocumentationPart"
  show AWSApiGatewayDocumentationVersion            = "AWS::ApiGateway::DocumentationVersion"
  show AWSApiGatewayDomainName                      = "AWS::ApiGateway::DomainName"
  show AWSApiGatewayGatewayResponse                 = "AWS::ApiGateway::GatewayResponse"
  show AWSApiGatewayMethod                          = "AWS::ApiGateway::Method"
  show AWSApiGatewayModel                           = "AWS::ApiGateway::Model"
  show AWSApiGatewayRequestValidator                = "AWS::ApiGateway::RequestValidator"
  show AWSApiGatewayResource                        = "AWS::ApiGateway::Resource"
  show AWSApiGatewayStage                           = "AWS::ApiGateway::Stage"
  show AWSApiGatewayUsagePlanKey                    = "AWS::ApiGateway::UsagePlanKey"
  show AWSApiGatewayVpcLink                         = "AWS::ApiGateway::VpcLink"
  show AWSApplicationAutoScalingScalableTarget      = "AWS::ApplicationAutoScaling::ScalableTarget"
  show AWSApplicationAutoScalingScalingPolicy       = "AWS::ApplicationAutoScaling::ScalingPolicy"
  show AWSAppStreamDirectoryConfig                  = "AWS::AppStream::DirectoryConfig"
  show AWSAppStreamUser                             = "AWS::AppStream::User"
  show AWSAppStreamStackUserAssociation             = "AWS::AppStream::StackUserAssociation"
  show AWSAppStreamStackFleetAssociation            = "AWS::AppStream::StackFleetAssociation"
  show AWSAppStreamImageBuilder                     = "AWS::AppStream::ImageBuilder"
  show AWSAppStreamFleet                            = "AWS::AppStream::Fleet"
  show AWSAppSyncDataSource                         = "AWS::AppSync::DataSource"
  show AWSAppSyncFunctionConfiguration              = "AWS::AppSync::FunctionConfiguration"
  show AWSAppSyncGraphQLApi                         = "AWS::AppSync::GraphQLApi"
  show AWSAppSyncGraphQLSchema                      = "AWS::AppSync::GraphQLSchema"
  show AWSAppSyncResolver                           = "AWS::AppSync::Resolver"
  show AWSAthenaNamedQuery                          = "AWS::Athena::NamedQuery"
  show AWSAutoScalingPlansScalingPlan               = "AWS::AutoScalingPlans::ScalingPlan"
  show AWSAutoScalingScheduledAction                = "AWS::AutoScaling::ScheduledAction"
  show AWSAutoScalingScalingPolicy                  = "AWS::AutoScaling::ScalingPolicy"
  show AWSAutoScalingLifecycleHook                  = "AWS::AutoScaling::LifecycleHook"
  show AWSAutoScalingLaunchConfiguration            = "AWS::AutoScaling::LaunchConfiguration"
  show AWSAutoScalingAutoScalingGroup               = "AWS::AutoScaling::AutoScalingGroup"
  show AWSBatchJobQueue                             = "AWS::Batch::JobQueue"
  show AWSBatchJobDefinition                        = "AWS::Batch::JobDefinition"
  show AWSBatchComputeEnvironment                   = "AWS::Batch::ComputeEnvironment"
  show AWSBudgetsBudget                             = "AWS::Budgets::Budget"
  show AWSCertificateManagerCertificate             = "AWS::CertificateManager::Certificate"
  show AWSCloud9EnvironmentEC2                      = "AWS::Cloud9::EnvironmentEC2"
  show AWSCloudFormationAuthentication              = "AWS::CloudFormation::Authentication"
  show AWSCloudFormationCustomResource              = "AWS::CloudFormation::CustomResource"
  show AWSCloudFormationInit                        = "AWS::CloudFormation::Init"
  show AWSCloudFormationInterface                   = "AWS::CloudFormation::Interface"
  show AWSCloudFormationMacro                       = "AWS::CloudFormation::Macro"
  show AWSCloudFormationStack                       = "AWS::CloudFormation::Stack"
  show AWSCloudFormationWaitCondition               = "AWS::CloudFormation::WaitCondition"
  show AWSCloudFormationWaitConditionHandle         = "AWS::CloudFormation::WaitConditionHandle"
  show AWSCloudFrontDistribution                    = "AWS::CloudFront::Distribution"
  show AWSCloudFrontCloudFrontOriginAccessIdentity  = "AWS::CloudFront::CloudFrontOriginAccessIdentity"
  show AWSCloudFrontStreamingDistribution           = "AWS::CloudFront::StreamingDistribution"
  show AWSServiceDiscoveryInstance                  = "AWS::ServiceDiscovery::Instance"
  show AWSServiceDiscoveryHttpNamespace             = "AWS::ServiceDiscovery::HttpNamespace"
  show AWSServiceDiscoveryPrivateDnsNamespace       = "AWS::ServiceDiscovery::PrivateDnsNamespace"
  show AWSServiceDiscoveryPublicDnsNamespace        = "AWS::ServiceDiscovery::PublicDnsNamespace"
  show AWSServiceDiscoveryService                   = "AWS::ServiceDiscovery::Service"
  show AWSCloudTrailTrail                           = "AWS::CloudTrail::Trail"
  show AWSCloudWatchAlarm                           = "AWS::CloudWatch::Alarm"
  show AWSCloudWatchDashboard                       = "AWS::CloudWatch::Dashboard"
  show AWSEventsRule                                = "AWS::Events::Rule"
  show AWSEventsEventBusPolicy                      = "AWS::Events::EventBusPolicy"
  show AWSLogsDestination                           = "AWS::Logs::Destination"
  show AWSLogsLogGroup                              = "AWS::Logs::LogGroup"
  show AWSLogsLogStream                             = "AWS::Logs::LogStream"
  show AWSLogsMetricFilter                          = "AWS::Logs::MetricFilter"
  show AWSLogsSubscriptionFilter                    = "AWS::Logs::SubscriptionFilter"
  show AWSCodeBuildProject                          = "AWS::CodeBuild::Project"
  show AWSCodeCommitRepository                      = "AWS::CodeCommit::Repository"
  show AWSCodeDeployApplication                     = "AWS::CodeDeploy::Application"
  show AWSCodeDeployDeploymentConfig                = "AWS::CodeDeploy::DeploymentConfig"
  show AWSCodeDeployDeploymentGroup                 = "AWS::CodeDeploy::DeploymentGroup"
  show AWSCodePipelineCustomActionType              = "AWS::CodePipeline::CustomActionType"
  show AWSCodePipelinePipeline                      = "AWS::CodePipeline::Pipeline"
  show AWSCodePipelineWebhook                       = "AWS::CodePipeline::Webhook"
  show AWSCognitoIdentityPool                       = "AWS::Cognito::IdentityPool"
  show AWSCognitoIdentityPoolRoleAttachment         = "AWS::Cognito::IdentityPoolRoleAttachment"
  show AWSCognitoUserPool                           = "AWS::Cognito::UserPool"
  show AWSCognitoUserPoolClient                     = "AWS::Cognito::UserPoolClient"
  show AWSCognitoUserPoolGroup                      = "AWS::Cognito::UserPoolGroup"
  show AWSCognitoUserPoolUser                       = "AWS::Cognito::UserPoolUser"
  show AWSCognitoUserPoolUserToGroupAttachment      = "AWS::Cognito::UserPoolUserToGroupAttachment"
  show AWSConfigAggregationAuthorization            = "AWS::Config::AggregationAuthorization"
  show AWSConfigConfigRule                          = "AWS::Config::ConfigRule"
  show AWSConfigConfigurationAggregator             = "AWS::Config::ConfigurationAggregator"
  show AWSConfigConfigurationRecorder               = "AWS::Config::ConfigurationRecorder"
  show AWSConfigDeliveryChannel                     = "AWS::Config::DeliveryChannel"
  show AWSDataPipelinePipeline                      = "AWS::DataPipeline::Pipeline"
  show AWSDAXCluster                                = "AWS::DAX::Cluster"
  show AWSDAXParameterGroup                         = "AWS::DAX::ParameterGroup"
  show AWSDAXSubnetGroup                            = "AWS::DAX::SubnetGroup"
  show AWSDirectoryServiceMicrosoftAD               = "AWS::DirectoryService::MicrosoftAD"
  show AWSDirectoryServiceSimpleAD                  = "AWS::DirectoryService::SimpleAD"
  show AWSDLMLifecyclePolicy                        = "AWS::DLM::LifecyclePolicy"
  show AWSDMSCertificate                            = "AWS::DMS::Certificate"
  show AWSDMSEndpoint                               = "AWS::DMS::Endpoint"
  show AWSDMSEventSubscription                      = "AWS::DMS::EventSubscription"
  show AWSDMSReplicationInstance                    = "AWS::DMS::ReplicationInstance"
  show AWSDMSReplicationSubnetGroup                 = "AWS::DMS::ReplicationSubnetGroup"
  show AWSDMSReplicationTask                        = "AWS::DMS::ReplicationTask"
  show AWSDocDBDBCluster                            = "AWS::DocDB::DBCluster"
  show AWSDocDBDBClusterParameterGroup              = "AWS::DocDB::DBClusterParameterGroup"
  show AWSDocDBDBInstance                           = "AWS::DocDB::DBInstance"
  show AWSDocDBDBSubnetGroup                        = "AWS::DocDB::DBSubnetGroup"
  show AWSDynamoDBTable                             = "AWS::DynamoDB::Table"
  show AWSEC2CustomerGateway                        = "AWS::EC2::CustomerGateway"
  show AWSEC2DHCPOptions                            = "AWS::EC2::DHCPOptions"
  show AWSEC2EC2Fleet                               = "AWS::EC2::EC2Fleet"
  show AWSEC2EgressOnlyInternetGateway              = "AWS::EC2::EgressOnlyInternetGateway"
  show AWSEC2EIP                                    = "AWS::EC2::EIP"
  show AWSEC2EIPAssociation                         = "AWS::EC2::EIPAssociation"
  show AWSEC2FlowLog                                = "AWS::EC2::FlowLog"
  show AWSEC2Host                                   = "AWS::EC2::Host"
  show AWSEC2Instance                               = "AWS::EC2::Instance"
  show AWSEC2InternetGateway                        = "AWS::EC2::InternetGateway"
  show AWSEC2LaunchTemplate                         = "AWS::EC2::LaunchTemplate"
  show AWSEC2NatGateway                             = "AWS::EC2::NatGateway"
  show AWSEC2NetworkAcl                             = "AWS::EC2::NetworkAcl"
  show AWSEC2NetworkAclEntry                        = "AWS::EC2::NetworkAclEntry"
  show AWSEC2NetworkInterface                       = "AWS::EC2::NetworkInterface"
  show AWSEC2NetworkInterfaceAttachment             = "AWS::EC2::NetworkInterfaceAttachment"
  show AWSEC2NetworkInterfacePermission             = "AWS::EC2::NetworkInterfacePermission"
  show AWSEC2PlacementGroup                         = "AWS::EC2::PlacementGroup"
  show AWSEC2Route                                  = "AWS::EC2::Route"
  show AWSEC2RouteTable                             = "AWS::EC2::RouteTable"
  show AWSEC2SecurityGroup                          = "AWS::EC2::SecurityGroup"
  show AWSEC2SecurityGroupEgress                    = "AWS::EC2::SecurityGroupEgress"
  show AWSEC2SecurityGroupIngress                   = "AWS::EC2::SecurityGroupIngress"
  show AWSEC2SpotFleet                              = "AWS::EC2::SpotFleet"
  show AWSEC2Subnet                                 = "AWS::EC2::Subnet"
  show AWSEC2SubnetCidrBlock                        = "AWS::EC2::SubnetCidrBlock"
  show AWSEC2SubnetNetworkAclAssociation            = "AWS::EC2::SubnetNetworkAclAssociation"
  show AWSEC2SubnetRouteTableAssociation            = "AWS::EC2::SubnetRouteTableAssociation"
  show AWSEC2TransitGateway                         = "AWS::EC2::TransitGateway"
  show AWSEC2TransitGatewayAttachment               = "AWS::EC2::TransitGatewayAttachment"
  show AWSEC2TransitGatewayRoute                    = "AWS::EC2::TransitGatewayRoute"
  show AWSEC2TransitGatewayRouteTable               = "AWS::EC2::TransitGatewayRouteTable"
  show AWSEC2TransitGatewayRouteTableAssociation    = "AWS::EC2::TransitGatewayRouteTableAssociation"
  show AWSEC2TransitGatewayRouteTablePropagation    = "AWS::EC2::TransitGatewayRouteTablePropagation"
  show AWSEC2Volume                                 = "AWS::EC2::Volume"
  show AWSEC2VolumeAttachment                       = "AWS::EC2::VolumeAttachment"
  show AWSEC2VPC                                    = "AWS::EC2::VPC"
  show AWSEC2VPCCidrBlock                           = "AWS::EC2::VPCCidrBlock"
  show AWSEC2VPCDHCPOptionsAssociation              = "AWS::EC2::VPCDHCPOptionsAssociation"
  show AWSEC2VPCEndpoint                            = "AWS::EC2::VPCEndpoint"
  show AWSEC2VPCEndpointConnectionNotification      = "AWS::EC2::VPCEndpointConnectionNotification"
  show AWSEC2VPCEndpointService                     = "AWS::EC2::VPCEndpointService"
  show AWSEC2VPCEndpointServicePermissions          = "AWS::EC2::VPCEndpointServicePermissions"
  show AWSEC2VPCGatewayAttachment                   = "AWS::EC2::VPCGatewayAttachment"
  show AWSEC2VPCPeeringConnection                   = "AWS::EC2::VPCPeeringConnection"
  show AWSEC2VPNConnection                          = "AWS::EC2::VPNConnection"
  show AWSEC2VPNConnectionRoute                     = "AWS::EC2::VPNConnectionRoute"
  show AWSEC2VPNGateway                             = "AWS::EC2::VPNGateway"
  show AWSEC2VPNGatewayRoutePropagation             = "AWS::EC2::VPNGatewayRoutePropagation"
  show AWSECRRepository                             = "AWS::ECR::Repository"
  show AWSEFSFileSystem                             = "AWS::EFS::FileSystem"
  show AWSEFSMountTarget                            = "AWS::EFS::MountTarget"
  show AWSEKSCluster                                = "AWS::EKS::Cluster"
  show AWSElastiCacheCacheCluster                   = "AWS::ElastiCache::CacheCluster"
  show AWSElastiCacheParameterGroup                 = "AWS::ElastiCache::ParameterGroup"
  show AWSElastiCacheReplicationGroup               = "AWS::ElastiCache::ReplicationGroup"
  show AWSElastiCacheSecurityGroup                  = "AWS::ElastiCache::SecurityGroup"
  show AWSElastiCacheSecurityGroupIngress           = "AWS::ElastiCache::SecurityGroupIngress"
  show AWSElastiCacheSubnetGroup                    = "AWS::ElastiCache::SubnetGroup"
  show AWSElasticsearchDomain                       = "AWS::Elasticsearch::Domain"
  show AWSElasticBeanstalkApplication               = "AWS::ElasticBeanstalk::Application"
  show AWSElasticBeanstalkApplicationVersion        = "AWS::ElasticBeanstalk::ApplicationVersion"
  show AWSElasticBeanstalkConfigurationTemplate     = "AWS::ElasticBeanstalk::ConfigurationTemplate"
  show AWSElasticBeanstalkEnvironment               = "AWS::ElasticBeanstalk::Environment"
  show AWSElasticLoadBalancingLoadBalancer          = "AWS::ElasticLoadBalancing::LoadBalancer"
  show AWSElasticLoadBalancingV2Listener            = "AWS::ElasticLoadBalancingV2::Listener"
  show AWSElasticLoadBalancingV2ListenerCertificate = "AWS::ElasticLoadBalancingV2::ListenerCertificate"
  show AWSElasticLoadBalancingV2ListenerRule        = "AWS::ElasticLoadBalancingV2::ListenerRule"
  show AWSElasticLoadBalancingV2LoadBalancer        = "AWS::ElasticLoadBalancingV2::LoadBalancer"
  show AWSElasticLoadBalancingV2TargetGroup         = "AWS::ElasticLoadBalancingV2::TargetGroup"
  show AWSEMRCluster                                = "AWS::EMR::Cluster"
  show AWSEMRInstanceFleetConfig                    = "AWS::EMR::InstanceFleetConfig"
  show AWSEMRInstanceGroupConfig                    = "AWS::EMR::InstanceGroupConfig"
  show AWSEMRSecurityConfiguration                  = "AWS::EMR::SecurityConfiguration"
  show AWSEMRStep                                   = "AWS::EMR::Step"

instance ToJSON ServiceType
