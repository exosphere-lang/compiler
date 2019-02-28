{-# LANGUAGE DeriveGeneric #-}

module ServiceType where

import Data.Aeson
import GHC.Generics

data ServiceType 
  = ApiGatewayAccount
  | ApiGatewayApiKey
  | ApiGatewayClientCertificate
  | ApiGatewayRestApi
  | ApiGatewayUsagePlan
  | AppStreamStack
  | AppSyncApiKey
  | AlexaASKSkill
  | AmazonMQBroker
  | AmazonMQConfiguration
  | AmazonMQConfigurationAssociation
  | ApiGatewayAuthorizer
  | ApiGatewayBasePathMapping
  | ApiGatewayDeployment
  | ApiGatewayDocumentationPart
  | ApiGatewayDocumentationVersion
  | ApiGatewayDomainName
  | ApiGatewayGatewayResponse
  | ApiGatewayMethod
  | ApiGatewayModel
  | ApiGatewayRequestValidator
  | ApiGatewayResource
  | ApiGatewayStage
  | ApiGatewayUsagePlanKey
  | ApiGatewayVpcLink
  | ApplicationAutoScalingScalableTarget
  | ApplicationAutoScalingScalingPolicy
  | AppStreamDirectoryConfig
  | AppStreamUser
  | AppStreamStackUserAssociation
  | AppStreamStackFleetAssociation
  | AppStreamImageBuilder
  | AppStreamFleet
  | AppSyncDataSource
  | AppSyncFunctionConfiguration
  | AppSyncGraphQLApi
  | AppSyncGraphQLSchema
  | AppSyncResolver
  | AthenaNamedQuery
  | AutoScalingPlansScalingPlan
  | AutoScalingScheduledAction
  | AutoScalingScalingPolicy
  | AutoScalingLifecycleHook
  | AutoScalingLaunchConfiguration
  | AutoScalingAutoScalingGroup
  | BatchJobQueue
  | BatchJobDefinition
  | BatchComputeEnvironment
  | BudgetsBudget
  | CertificateManagerCertificate
  | Cloud9EnvironmentEC2
  | CloudFormationAuthentication
  | CloudFormationCustomResource
  | CloudFormationInit
  | CloudFormationInterface
  | CloudFormationMacro
  | CloudFormationStack
  | CloudFormationWaitCondition
  | CloudFormationWaitConditionHandle
  | CloudFrontDistribution
  | CloudFrontCloudFrontOriginAccessIdentity
  | CloudFrontStreamingDistribution
  | ServiceDiscoveryInstance
  | ServiceDiscoveryHttpNamespace
  | ServiceDiscoveryPrivateDnsNamespace
  | ServiceDiscoveryPublicDnsNamespace
  | ServiceDiscoveryService
  | CloudTrailTrail
  | CloudWatchAlarm
  | CloudWatchDashboard
  | EventsRule
  | EventsEventBusPolicy
  | LogsDestination
  | LogsLogGroup
  | LogsLogStream
  | LogsMetricFilter
  | LogsSubscriptionFilter
  | CodeBuildProject
  | CodeCommitRepository
  | CodeDeployApplication
  | CodeDeployDeploymentConfig
  | CodeDeployDeploymentGroup
  | CodePipelineCustomActionType
  | CodePipelinePipeline
  | CodePipelineWebhook
  | CognitoIdentityPool
  | CognitoIdentityPoolRoleAttachment
  | CognitoUserPool
  | CognitoUserPoolClient
  | CognitoUserPoolGroup
  | CognitoUserPoolUser
  | CognitoUserPoolUserToGroupAttachment
  | ConfigAggregationAuthorization
  | ConfigConfigRule
  | ConfigConfigurationAggregator
  | ConfigConfigurationRecorder
  | ConfigDeliveryChannel
  | DataPipelinePipeline
  | DAXCluster
  | DAXParameterGroup
  | DAXSubnetGroup
  | DirectoryServiceMicrosoftAD
  | DirectoryServiceSimpleAD
  | DLMLifecyclePolicy
  | DMSCertificate
  | DMSEndpoint
  | DMSEventSubscription
  | DMSReplicationInstance
  | DMSReplicationSubnetGroup
  | DMSReplicationTask
  | DocDBDBCluster
  | DocDBDBClusterParameterGroup
  | DocDBDBInstance
  | DocDBDBSubnetGroup
  | DynamoDBTable
  | EC2CustomerGateway
  | EC2DHCPOptions
  | EC2EC2Fleet
  | EC2EgressOnlyInternetGateway
  | EC2EIP
  | EC2EIPAssociation
  | EC2FlowLog
  | EC2Host
  | EC2Instance
  | EC2InternetGateway
  | EC2LaunchTemplate
  | EC2NatGateway
  | EC2NetworkAcl
  | EC2NetworkAclEntry
  | EC2NetworkInterface
  | EC2NetworkInterfaceAttachment
  | EC2NetworkInterfacePermission
  | EC2PlacementGroup
  | EC2Route
  | EC2RouteTable
  | EC2SecurityGroup
  | EC2SecurityGroupEgress
  | EC2SecurityGroupIngress
  | EC2SpotFleet
  | EC2Subnet
  | EC2SubnetCidrBlock
  | EC2SubnetNetworkAclAssociation
  | EC2SubnetRouteTableAssociation
  | EC2TransitGateway
  | EC2TransitGatewayAttachment
  | EC2TransitGatewayRoute
  | EC2TransitGatewayRouteTable
  | EC2TransitGatewayRouteTableAssociation
  | EC2TransitGatewayRouteTablePropagation
  | EC2Volume
  | EC2VolumeAttachment
  | EC2VPC
  | EC2VPCCidrBlock
  | EC2VPCDHCPOptionsAssociation
  | EC2VPCEndpoint
  | EC2VPCEndpointConnectionNotification
  | EC2VPCEndpointService
  | EC2VPCEndpointServicePermissions
  | EC2VPCGatewayAttachment
  | EC2VPCPeeringConnection
  | EC2VPNConnection
  | EC2VPNConnectionRoute
  | EC2VPNGateway
  | EC2VPNGatewayRoutePropagation
  | ECRRepository
  | EFSFileSystem
  | EFSMountTarget
  | EKSCluster
  | ECSCluster
  | ECSService
  | ECSTaskDefinition
  | ElastiCacheCacheCluster
  | ElastiCacheParameterGroup
  | ElastiCacheReplicationGroup
  | ElastiCacheSecurityGroup
  | ElastiCacheSecurityGroupIngress
  | ElastiCacheSubnetGroup
  | ElasticsearchDomain
  | ElasticBeanstalkApplication
  | ElasticBeanstalkApplicationVersion
  | ElasticBeanstalkConfigurationTemplate
  | ElasticBeanstalkEnvironment
  | ElasticLoadBalancingLoadBalancer
  | ElasticLoadBalancingV2Listener
  | ElasticLoadBalancingV2ListenerCertificate
  | ElasticLoadBalancingV2ListenerRule
  | ElasticLoadBalancingV2LoadBalancer
  | ElasticLoadBalancingV2TargetGroup
  | EMRCluster
  | EMRInstanceFleetConfig
  | EMRInstanceGroupConfig
  | EMRSecurityConfiguration
  | EMRStep
  | FSxFileSystem
  | GameLiftAlias
  | GameLiftBuild
  | GameLiftFleet
  | GlueClassifier
  | GlueConnection
  | GlueCrawler
  | GlueDatabase
  | GlueDevEndpoint
  | GlueJob
  | GluePartition
  | GlueTable
  | GlueTrigger
  | GuardDutyDetector
  | GuardDutyFilter
  | GuardDutyMaster
  | GuardDutyMember
  | GuardDutyIPSet
  | GuardDutyThreatIntelSet
  | IAMAccessKey
  | IAMGroup
  | IAMInstanceProfile
  | IAMManagedPolicy
  | IAMPolicy
  | IAMRole
  | IAMServiceLinkedRole
  | IAMUser
  | IAMUserToGroupAddition
  | InspectorAssessmentTarget
  | InspectorAssessmentTemplate
  | InspectorResourceGroup
  | IoTCertificate
  | IoTPolicy
  | IoTPolicyPrincipalAttachment
  | IoTThing
  | IoTThingPrincipalAttachment
  | IoTTopicRule
  | IoT1ClickDevice
  | IoT1ClickPlacement
  | IoT1ClickProject
  | IoTAnalyticsChannel
  | IoTAnalyticsDataset
  | IoTAnalyticsDatastore
  | IoTAnalyticsPipeline
  | KinesisStream
  | KinesisStreamConsumer
  | KinesisFirehoseDeliveryStream
  | KinesisAnalyticsApplication
  | KinesisAnalyticsApplicationOutput
  | KinesisAnalyticsApplicationReferenceDataSource
  | KinesisAnalyticsV2Application
  | KinesisAnalyticsV2ApplicationOutput
  | KinesisAnalyticsV2ApplicationReferenceDataSource
  | KinesisAnalyticsV2ApplicationCloudWatchLoggingOption
  | KMSAlias
  | KMSKey
  | LambdaEventSourceMapping
  | LambdaAlias
  | LambdaFunction
  | LambdaLayerVersion
  | LambdaLayerVersionPermission
  | LambdaPermission
  | LambdaVersion
  | NeptuneDBCluster
  | NeptuneDBClusterParameterGroup
  | NeptuneDBInstance
  | NeptuneDBParameterGroup
  | NeptuneDBSubnetGroup
  | OpsWorksApp
  | OpsWorksElasticLoadBalancerAttachment
  | OpsWorksInstance
  | OpsWorksLayer
  | OpsWorksStack
  | OpsWorksUserProfile
  | OpsWorksVolume
  | OpsWorksCMServer
  | RAMResourceShare
  | RDSDBCluster
  | RDSDBClusterParameterGroup
  | RDSDBInstance
  | RDSDBParameterGroup
  | RDSDBSecurityGroup
  | RDSDBSecurityGroupIngress
  | RDSDBSubnetGroup
  | RDSEventSubscription
  | RDSOptionGroup
  | RedshiftCluster
  | RedshiftClusterParameterGroup
  | RedshiftClusterSecurityGroup
  | RedshiftClusterSecurityGroupIngress
  | RedshiftClusterSubnetGroup
  | RoboMakerFleet
  | RoboMakerRobot
  | RoboMakerRobotApplication
  | RoboMakerRobotApplicationVersion
  | RoboMakerSimulationApplication
  | RoboMakerSimulationApplicationVersion
  | Route53HealthCheck
  | Route53HostedZone
  | Route53RecordSet
  | Route53RecordSetGroup
  | Route53ResolverResolverEndpoint
  | Route53ResolverResolverRule
  | Route53ResolverResolverRuleAssociation
  | S3Bucket
  | S3BucketPolicy
  | SageMakerEndpoint
  | SageMakerEndpointConfig
  | SageMakerModel
  | SageMakerNotebookInstance
  | SageMakerNotebookInstanceLifecycleConfig
  | SecretsManagerResourcePolicy
  | SecretsManagerRotationSchedule
  | SecretsManagerSecret
  | SecretsManagerSecretTargetAttachment
  | ServiceCatalogAcceptedPortfolioShare
  | ServiceCatalogCloudFormationProduct
  | ServiceCatalogCloudFormationProvisionedProduct
  | ServiceCatalogLaunchNotificationConstraint
  | ServiceCatalogLaunchRoleConstraint
  | ServiceCatalogLaunchTemplateConstraint
  | ServiceCatalogPortfolio
  | ServiceCatalogPortfolioPrincipalAssociation
  | ServiceCatalogPortfolioProductAssociation
  | ServiceCatalogPortfolioShare
  | ServiceCatalogTagOption
  | ServiceCatalogTagOptionAssociation
  | SESConfigurationSet
  | SESConfigurationSetEventDestination
  | SESReceiptFilter
  | SESReceiptRule
  | SESReceiptRuleSet
  | SESTemplate
  | SDBDomain
  | SNSSubscription
  | SNSTopic
  | SNSTopicPolicy
  | SQSQueue
  | SQSQueuePolicy
  | StepFunctionsActivity
  | StepFunctionsStateMachine
  | SSMAssociation
  | SSMDocument
  | SSMMaintenanceWindow
  | SSMMaintenanceWindowTarget
  | SSMMaintenanceWindowTask
  | SSMParameter
  | SSMPatchBaseline
  | SSMResourceDataSync
  | WAFByteMatchSet
  | WAFIPSet
  | WAFRule
  | WAFSizeConstraintSet
  | WAFSqlInjectionMatchSet
  | WAFWebACL
  | WAFXssMatchSet
  | WAFRegionalByteMatchSet
  | WAFRegionalIPSet
  | WAFRegionalRule
  | WAFRegionalSizeConstraintSet
  | WAFRegionalSqlInjectionMatchSet
  | WAFRegionalWebACL
  | WAFRegionalWebACLAssociation
  | WAFRegionalXssMatchSet
  | WorkSpacesWorkspace
  deriving (Eq, Generic)
 
instance Show ServiceType where
  show ApiGatewayAccount                                    = "AWS::ApiGateway::Account"
  show ApiGatewayApiKey                                     = "AWS::ApiGateway::ApiKey"
  show ApiGatewayClientCertificate                          = "AWS::ApiGateway::ClientCertificate"
  show ApiGatewayRestApi                                    = "AWS::ApiGateway::RestApi"
  show ApiGatewayUsagePlan                                  = "AWS::ApiGateway::UsagePlan"
  show AppStreamStack                                       = "AWS::AppStream::Stack"
  show AppSyncApiKey                                        = "AWS::AppSync::ApiKey"
  show AlexaASKSkill                                        = "Alexa::ASK::Skill"
  show AmazonMQBroker                                       = "AWS::AmazonMQ::Broker"
  show AmazonMQConfiguration                                = "AWS::AmazonMQ::Configuration"
  show AmazonMQConfigurationAssociation                     = "AWS::AmazonMQ::ConfigurationAssociation"
  show ApiGatewayAuthorizer                                 = "AWS::ApiGateway::Authorizer"
  show ApiGatewayBasePathMapping                            = "AWS::ApiGateway::BasePathMapping"
  show ApiGatewayDeployment                                 = "AWS::ApiGateway::Deployment"
  show ApiGatewayDocumentationPart                          = "AWS::ApiGateway::DocumentationPart"
  show ApiGatewayDocumentationVersion                       = "AWS::ApiGateway::DocumentationVersion"
  show ApiGatewayDomainName                                 = "AWS::ApiGateway::DomainName"
  show ApiGatewayGatewayResponse                            = "AWS::ApiGateway::GatewayResponse"
  show ApiGatewayMethod                                     = "AWS::ApiGateway::Method"
  show ApiGatewayModel                                      = "AWS::ApiGateway::Model"
  show ApiGatewayRequestValidator                           = "AWS::ApiGateway::RequestValidator"
  show ApiGatewayResource                                   = "AWS::ApiGateway::Resource"
  show ApiGatewayStage                                      = "AWS::ApiGateway::Stage"
  show ApiGatewayUsagePlanKey                               = "AWS::ApiGateway::UsagePlanKey"
  show ApiGatewayVpcLink                                    = "AWS::ApiGateway::VpcLink"
  show ApplicationAutoScalingScalableTarget                 = "AWS::ApplicationAutoScaling::ScalableTarget"
  show ApplicationAutoScalingScalingPolicy                  = "AWS::ApplicationAutoScaling::ScalingPolicy"
  show AppStreamDirectoryConfig                             = "AWS::AppStream::DirectoryConfig"
  show AppStreamUser                                        = "AWS::AppStream::User"
  show AppStreamStackUserAssociation                        = "AWS::AppStream::StackUserAssociation"
  show AppStreamStackFleetAssociation                       = "AWS::AppStream::StackFleetAssociation"
  show AppStreamImageBuilder                                = "AWS::AppStream::ImageBuilder"
  show AppStreamFleet                                       = "AWS::AppStream::Fleet"
  show AppSyncDataSource                                    = "AWS::AppSync::DataSource"
  show AppSyncFunctionConfiguration                         = "AWS::AppSync::FunctionConfiguration"
  show AppSyncGraphQLApi                                    = "AWS::AppSync::GraphQLApi"
  show AppSyncGraphQLSchema                                 = "AWS::AppSync::GraphQLSchema"
  show AppSyncResolver                                      = "AWS::AppSync::Resolver"
  show AthenaNamedQuery                                     = "AWS::Athena::NamedQuery"
  show AutoScalingPlansScalingPlan                          = "AWS::AutoScalingPlans::ScalingPlan"
  show AutoScalingScheduledAction                           = "AWS::AutoScaling::ScheduledAction"
  show AutoScalingScalingPolicy                             = "AWS::AutoScaling::ScalingPolicy"
  show AutoScalingLifecycleHook                             = "AWS::AutoScaling::LifecycleHook"
  show AutoScalingLaunchConfiguration                       = "AWS::AutoScaling::LaunchConfiguration"
  show AutoScalingAutoScalingGroup                          = "AWS::AutoScaling::AutoScalingGroup"
  show BatchJobQueue                                        = "AWS::Batch::JobQueue"
  show BatchJobDefinition                                   = "AWS::Batch::JobDefinition"
  show BatchComputeEnvironment                              = "AWS::Batch::ComputeEnvironment"
  show BudgetsBudget                                        = "AWS::Budgets::Budget"
  show CertificateManagerCertificate                        = "AWS::CertificateManager::Certificate"
  show Cloud9EnvironmentEC2                                 = "AWS::Cloud9::EnvironmentEC2"
  show CloudFormationAuthentication                         = "AWS::CloudFormation::Authentication"
  show CloudFormationCustomResource                         = "AWS::CloudFormation::CustomResource"
  show CloudFormationInit                                   = "AWS::CloudFormation::Init"
  show CloudFormationInterface                              = "AWS::CloudFormation::Interface"
  show CloudFormationMacro                                  = "AWS::CloudFormation::Macro"
  show CloudFormationStack                                  = "AWS::CloudFormation::Stack"
  show CloudFormationWaitCondition                          = "AWS::CloudFormation::WaitCondition"
  show CloudFormationWaitConditionHandle                    = "AWS::CloudFormation::WaitConditionHandle"
  show CloudFrontDistribution                               = "AWS::CloudFront::Distribution"
  show CloudFrontCloudFrontOriginAccessIdentity             = "AWS::CloudFront::CloudFrontOriginAccessIdentity"
  show CloudFrontStreamingDistribution                      = "AWS::CloudFront::StreamingDistribution"
  show ServiceDiscoveryInstance                             = "AWS::ServiceDiscovery::Instance"
  show ServiceDiscoveryHttpNamespace                        = "AWS::ServiceDiscovery::HttpNamespace"
  show ServiceDiscoveryPrivateDnsNamespace                  = "AWS::ServiceDiscovery::PrivateDnsNamespace"
  show ServiceDiscoveryPublicDnsNamespace                   = "AWS::ServiceDiscovery::PublicDnsNamespace"
  show ServiceDiscoveryService                              = "AWS::ServiceDiscovery::Service"
  show CloudTrailTrail                                      = "AWS::CloudTrail::Trail"
  show CloudWatchAlarm                                      = "AWS::CloudWatch::Alarm"
  show CloudWatchDashboard                                  = "AWS::CloudWatch::Dashboard"
  show EventsRule                                           = "AWS::Events::Rule"
  show EventsEventBusPolicy                                 = "AWS::Events::EventBusPolicy"
  show LogsDestination                                      = "AWS::Logs::Destination"
  show LogsLogGroup                                         = "AWS::Logs::LogGroup"
  show LogsLogStream                                        = "AWS::Logs::LogStream"
  show LogsMetricFilter                                     = "AWS::Logs::MetricFilter"
  show LogsSubscriptionFilter                               = "AWS::Logs::SubscriptionFilter"
  show CodeBuildProject                                     = "AWS::CodeBuild::Project"
  show CodeCommitRepository                                 = "AWS::CodeCommit::Repository"
  show CodeDeployApplication                                = "AWS::CodeDeploy::Application"
  show CodeDeployDeploymentConfig                           = "AWS::CodeDeploy::DeploymentConfig"
  show CodeDeployDeploymentGroup                            = "AWS::CodeDeploy::DeploymentGroup"
  show CodePipelineCustomActionType                         = "AWS::CodePipeline::CustomActionType"
  show CodePipelinePipeline                                 = "AWS::CodePipeline::Pipeline"
  show CodePipelineWebhook                                  = "AWS::CodePipeline::Webhook"
  show CognitoIdentityPool                                  = "AWS::Cognito::IdentityPool"
  show CognitoIdentityPoolRoleAttachment                    = "AWS::Cognito::IdentityPoolRoleAttachment"
  show CognitoUserPool                                      = "AWS::Cognito::UserPool"
  show CognitoUserPoolClient                                = "AWS::Cognito::UserPoolClient"
  show CognitoUserPoolGroup                                 = "AWS::Cognito::UserPoolGroup"
  show CognitoUserPoolUser                                  = "AWS::Cognito::UserPoolUser"
  show CognitoUserPoolUserToGroupAttachment                 = "AWS::Cognito::UserPoolUserToGroupAttachment"
  show ConfigAggregationAuthorization                       = "AWS::Config::AggregationAuthorization"
  show ConfigConfigRule                                     = "AWS::Config::ConfigRule"
  show ConfigConfigurationAggregator                        = "AWS::Config::ConfigurationAggregator"
  show ConfigConfigurationRecorder                          = "AWS::Config::ConfigurationRecorder"
  show ConfigDeliveryChannel                                = "AWS::Config::DeliveryChannel"
  show DataPipelinePipeline                                 = "AWS::DataPipeline::Pipeline"
  show DAXCluster                                           = "AWS::DAX::Cluster"
  show DAXParameterGroup                                    = "AWS::DAX::ParameterGroup"
  show DAXSubnetGroup                                       = "AWS::DAX::SubnetGroup"
  show DirectoryServiceMicrosoftAD                          = "AWS::DirectoryService::MicrosoftAD"
  show DirectoryServiceSimpleAD                             = "AWS::DirectoryService::SimpleAD"
  show DLMLifecyclePolicy                                   = "AWS::DLM::LifecyclePolicy"
  show DMSCertificate                                       = "AWS::DMS::Certificate"
  show DMSEndpoint                                          = "AWS::DMS::Endpoint"
  show DMSEventSubscription                                 = "AWS::DMS::EventSubscription"
  show DMSReplicationInstance                               = "AWS::DMS::ReplicationInstance"
  show DMSReplicationSubnetGroup                            = "AWS::DMS::ReplicationSubnetGroup"
  show DMSReplicationTask                                   = "AWS::DMS::ReplicationTask"
  show DocDBDBCluster                                       = "AWS::DocDB::DBCluster"
  show DocDBDBClusterParameterGroup                         = "AWS::DocDB::DBClusterParameterGroup"
  show DocDBDBInstance                                      = "AWS::DocDB::DBInstance"
  show DocDBDBSubnetGroup                                   = "AWS::DocDB::DBSubnetGroup"
  show DynamoDBTable                                        = "AWS::DynamoDB::Table"
  show EC2CustomerGateway                                   = "AWS::EC2::CustomerGateway"
  show EC2DHCPOptions                                       = "AWS::EC2::DHCPOptions"
  show EC2EC2Fleet                                          = "AWS::EC2::EC2Fleet"
  show EC2EgressOnlyInternetGateway                         = "AWS::EC2::EgressOnlyInternetGateway"
  show EC2EIP                                               = "AWS::EC2::EIP"
  show EC2EIPAssociation                                    = "AWS::EC2::EIPAssociation"
  show EC2FlowLog                                           = "AWS::EC2::FlowLog"
  show EC2Host                                              = "AWS::EC2::Host"
  show EC2Instance                                          = "AWS::EC2::Instance"
  show EC2InternetGateway                                   = "AWS::EC2::InternetGateway"
  show EC2LaunchTemplate                                    = "AWS::EC2::LaunchTemplate"
  show EC2NatGateway                                        = "AWS::EC2::NatGateway"
  show EC2NetworkAcl                                        = "AWS::EC2::NetworkAcl"
  show EC2NetworkAclEntry                                   = "AWS::EC2::NetworkAclEntry"
  show EC2NetworkInterface                                  = "AWS::EC2::NetworkInterface"
  show EC2NetworkInterfaceAttachment                        = "AWS::EC2::NetworkInterfaceAttachment"
  show EC2NetworkInterfacePermission                        = "AWS::EC2::NetworkInterfacePermission"
  show EC2PlacementGroup                                    = "AWS::EC2::PlacementGroup"
  show EC2Route                                             = "AWS::EC2::Route"
  show EC2RouteTable                                        = "AWS::EC2::RouteTable"
  show EC2SecurityGroup                                     = "AWS::EC2::SecurityGroup"
  show EC2SecurityGroupEgress                               = "AWS::EC2::SecurityGroupEgress"
  show EC2SecurityGroupIngress                              = "AWS::EC2::SecurityGroupIngress"
  show EC2SpotFleet                                         = "AWS::EC2::SpotFleet"
  show EC2Subnet                                            = "AWS::EC2::Subnet"
  show EC2SubnetCidrBlock                                   = "AWS::EC2::SubnetCidrBlock"
  show EC2SubnetNetworkAclAssociation                       = "AWS::EC2::SubnetNetworkAclAssociation"
  show EC2SubnetRouteTableAssociation                       = "AWS::EC2::SubnetRouteTableAssociation"
  show EC2TransitGateway                                    = "AWS::EC2::TransitGateway"
  show EC2TransitGatewayAttachment                          = "AWS::EC2::TransitGatewayAttachment"
  show EC2TransitGatewayRoute                               = "AWS::EC2::TransitGatewayRoute"
  show EC2TransitGatewayRouteTable                          = "AWS::EC2::TransitGatewayRouteTable"
  show EC2TransitGatewayRouteTableAssociation               = "AWS::EC2::TransitGatewayRouteTableAssociation"
  show EC2TransitGatewayRouteTablePropagation               = "AWS::EC2::TransitGatewayRouteTablePropagation"
  show EC2Volume                                            = "AWS::EC2::Volume"
  show EC2VolumeAttachment                                  = "AWS::EC2::VolumeAttachment"
  show EC2VPC                                               = "AWS::EC2::VPC"
  show EC2VPCCidrBlock                                      = "AWS::EC2::VPCCidrBlock"
  show EC2VPCDHCPOptionsAssociation                         = "AWS::EC2::VPCDHCPOptionsAssociation"
  show EC2VPCEndpoint                                       = "AWS::EC2::VPCEndpoint"
  show EC2VPCEndpointConnectionNotification                 = "AWS::EC2::VPCEndpointConnectionNotification"
  show EC2VPCEndpointService                                = "AWS::EC2::VPCEndpointService"
  show EC2VPCEndpointServicePermissions                     = "AWS::EC2::VPCEndpointServicePermissions"
  show EC2VPCGatewayAttachment                              = "AWS::EC2::VPCGatewayAttachment"
  show EC2VPCPeeringConnection                              = "AWS::EC2::VPCPeeringConnection"
  show EC2VPNConnection                                     = "AWS::EC2::VPNConnection"
  show EC2VPNConnectionRoute                                = "AWS::EC2::VPNConnectionRoute"
  show EC2VPNGateway                                        = "AWS::EC2::VPNGateway"
  show EC2VPNGatewayRoutePropagation                        = "AWS::EC2::VPNGatewayRoutePropagation"
  show ECSCluster                                           = "AWS::ECS::Cluster"
  show ECSService                                           = "AWS::ECS::Service"
  show ECSTaskDefinition                                    = "AWS::ECS::TaskDefinition"
  show ECRRepository                                        = "AWS::ECR::Repository"
  show EFSFileSystem                                        = "AWS::EFS::FileSystem"
  show EFSMountTarget                                       = "AWS::EFS::MountTarget"
  show EKSCluster                                           = "AWS::EKS::Cluster"
  show ElastiCacheCacheCluster                              = "AWS::ElastiCache::CacheCluster"
  show ElastiCacheParameterGroup                            = "AWS::ElastiCache::ParameterGroup"
  show ElastiCacheReplicationGroup                          = "AWS::ElastiCache::ReplicationGroup"
  show ElastiCacheSecurityGroup                             = "AWS::ElastiCache::SecurityGroup"
  show ElastiCacheSecurityGroupIngress                      = "AWS::ElastiCache::SecurityGroupIngress"
  show ElastiCacheSubnetGroup                               = "AWS::ElastiCache::SubnetGroup"
  show ElasticsearchDomain                                  = "AWS::Elasticsearch::Domain"
  show ElasticBeanstalkApplication                          = "AWS::ElasticBeanstalk::Application"
  show ElasticBeanstalkApplicationVersion                   = "AWS::ElasticBeanstalk::ApplicationVersion"
  show ElasticBeanstalkConfigurationTemplate                = "AWS::ElasticBeanstalk::ConfigurationTemplate"
  show ElasticBeanstalkEnvironment                          = "AWS::ElasticBeanstalk::Environment"
  show ElasticLoadBalancingLoadBalancer                     = "AWS::ElasticLoadBalancing::LoadBalancer"
  show ElasticLoadBalancingV2Listener                       = "AWS::ElasticLoadBalancingV2::Listener"
  show ElasticLoadBalancingV2ListenerCertificate            = "AWS::ElasticLoadBalancingV2::ListenerCertificate"
  show ElasticLoadBalancingV2ListenerRule                   = "AWS::ElasticLoadBalancingV2::ListenerRule"
  show ElasticLoadBalancingV2LoadBalancer                   = "AWS::ElasticLoadBalancingV2::LoadBalancer"
  show ElasticLoadBalancingV2TargetGroup                    = "AWS::ElasticLoadBalancingV2::TargetGroup"
  show EMRCluster                                           = "AWS::EMR::Cluster"
  show EMRInstanceFleetConfig                               = "AWS::EMR::InstanceFleetConfig"
  show EMRInstanceGroupConfig                               = "AWS::EMR::InstanceGroupConfig"
  show EMRSecurityConfiguration                             = "AWS::EMR::SecurityConfiguration"
  show EMRStep                                              = "AWS::EMR::Step"
  show FSxFileSystem                                        = "AWS::FSx::FileSystem"
  show GameLiftAlias                                        = "AWS::GameLift::Alias"
  show GameLiftBuild                                        = "AWS::GameLift::Build"
  show GameLiftFleet                                        = "AWS::GameLift::Fleet"
  show GlueClassifier                                       = "AWS::Glue::Classifier"
  show GlueConnection                                       = "AWS::Glue::Connection"
  show GlueCrawler                                          = "AWS::Glue::Crawler"
  show GlueDatabase                                         = "AWS::Glue::Database"
  show GlueDevEndpoint                                      = "AWS::Glue::DevEndpoint"
  show GlueJob                                              = "AWS::Glue::Job"
  show GluePartition                                        = "AWS::Glue::Partition"
  show GlueTable                                            = "AWS::Glue::Table"
  show GlueTrigger                                          = "AWS::Glue::Trigger"
  show GuardDutyDetector                                    = "AWS::GuardDuty::Detector"
  show GuardDutyFilter                                      = "AWS::GuardDuty::Filter"
  show GuardDutyMaster                                      = "AWS::GuardDuty::Master"
  show GuardDutyMember                                      = "AWS::GuardDuty::Member"
  show GuardDutyIPSet                                       = "AWS::GuardDuty::IPSet"
  show GuardDutyThreatIntelSet                              = "AWS::GuardDuty::ThreatIntelSet"
  show IAMAccessKey                                         = "AWS::IAM::AccessKey"
  show IAMGroup                                             = "AWS::IAM::Group"
  show IAMInstanceProfile                                   = "AWS::IAM::InstanceProfile"
  show IAMManagedPolicy                                     = "AWS::IAM::ManagedPolicy"
  show IAMPolicy                                            = "AWS::IAM::Policy"
  show IAMRole                                              = "AWS::IAM::Role"
  show IAMServiceLinkedRole                                 = "AWS::IAM::ServiceLinkedRole"
  show IAMUser                                              = "AWS::IAM::User"
  show IAMUserToGroupAddition                               = "AWS::IAM::UserToGroupAddition"
  show InspectorAssessmentTarget                            = "AWS::Inspector::AssessmentTarget"
  show InspectorAssessmentTemplate                          = "AWS::Inspector::AssessmentTemplate"
  show InspectorResourceGroup                               = "AWS::Inspector::ResourceGroup"
  show IoTCertificate                                       = "AWS::IoT::Certificate"
  show IoTPolicy                                            = "AWS::IoT::Policy"
  show IoTPolicyPrincipalAttachment                         = "AWS::IoT::PolicyPrincipalAttachment"
  show IoTThing                                             = "AWS::IoT::Thing"
  show IoTThingPrincipalAttachment                          = "AWS::IoT::ThingPrincipalAttachment"
  show IoTTopicRule                                         = "AWS::IoT::TopicRule"
  show IoT1ClickDevice                                      = "AWS::IoT1Click::Device"
  show IoT1ClickPlacement                                   = "AWS::IoT1Click::Placement"
  show IoT1ClickProject                                     = "AWS::IoT1Click::Project"
  show IoTAnalyticsChannel                                  = "AWS::IoTAnalytics::Channel"
  show IoTAnalyticsDataset                                  = "AWS::IoTAnalytics::Dataset"
  show IoTAnalyticsDatastore                                = "AWS::IoTAnalytics::Datastore"
  show IoTAnalyticsPipeline                                 = "AWS::IoTAnalytics::Pipeline"
  show KinesisStream                                        = "AWS::Kinesis::Stream"
  show KinesisStreamConsumer                                = "AWS::Kinesis::StreamConsumer"
  show KinesisFirehoseDeliveryStream                        = "AWS::KinesisFirehose::DeliveryStream"
  show KinesisAnalyticsApplication                          = "AWS::KinesisAnalytics::Application"
  show KinesisAnalyticsApplicationOutput                    = "AWS::KinesisAnalytics::ApplicationOutput"
  show KinesisAnalyticsApplicationReferenceDataSource       = "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
  show KinesisAnalyticsV2Application                        = "AWS::KinesisAnalyticsV2::Application"
  show KinesisAnalyticsV2ApplicationOutput                  = "AWS::KinesisAnalyticsV2::ApplicationOutput"
  show KinesisAnalyticsV2ApplicationReferenceDataSource     = "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
  show KinesisAnalyticsV2ApplicationCloudWatchLoggingOption = "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
  show KMSAlias                                             = "AWS::KMS::Alias"
  show KMSKey                                               = "AWS::KMS::Key"
  show LambdaEventSourceMapping                             = "AWS::Lambda::EventSourceMapping"
  show LambdaAlias                                          = "AWS::Lambda::Alias"
  show LambdaFunction                                       = "AWS::Lambda::Function"
  show LambdaLayerVersion                                   = "AWS::Lambda::LayerVersion"
  show LambdaLayerVersionPermission                         = "AWS::Lambda::LayerVersionPermission"
  show LambdaPermission                                     = "AWS::Lambda::Permission"
  show LambdaVersion                                        = "AWS::Lambda::Version"
  show NeptuneDBCluster                                     = "AWS::Neptune::DBCluster"
  show NeptuneDBClusterParameterGroup                       = "AWS::Neptune::DBClusterParameterGroup"
  show NeptuneDBInstance                                    = "AWS::Neptune::DBInstance"
  show NeptuneDBParameterGroup                              = "AWS::Neptune::DBParameterGroup"
  show NeptuneDBSubnetGroup                                 = "AWS::Neptune::DBSubnetGroup"
  show OpsWorksApp                                          = "AWS::OpsWorks::App"
  show OpsWorksElasticLoadBalancerAttachment                = "AWS::OpsWorks::ElasticLoadBalancerAttachment"
  show OpsWorksInstance                                     = "AWS::OpsWorks::Instance"
  show OpsWorksLayer                                        = "AWS::OpsWorks::Layer"
  show OpsWorksStack                                        = "AWS::OpsWorks::Stack"
  show OpsWorksUserProfile                                  = "AWS::OpsWorks::UserProfile"
  show OpsWorksVolume                                       = "AWS::OpsWorks::Volume"
  show OpsWorksCMServer                                     = "AWS::OpsWorksCM::Server"
  show RAMResourceShare                                     = "AWS::RAM::ResourceShare"
  show RDSDBCluster                                         = "AWS::RDS::DBCluster"
  show RDSDBClusterParameterGroup                           = "AWS::RDS::DBClusterParameterGroup"
  show RDSDBInstance                                        = "AWS::RDS::DBInstance"
  show RDSDBParameterGroup                                  = "AWS::RDS::DBParameterGroup"
  show RDSDBSecurityGroup                                   = "AWS::RDS::DBSecurityGroup"
  show RDSDBSecurityGroupIngress                            = "AWS::RDS::DBSecurityGroupIngress"
  show RDSDBSubnetGroup                                     = "AWS::RDS::DBSubnetGroup"
  show RDSEventSubscription                                 = "AWS::RDS::EventSubscription"
  show RDSOptionGroup                                       = "AWS::RDS::OptionGroup"
  show RedshiftCluster                                      = "AWS::Redshift::Cluster"
  show RedshiftClusterParameterGroup                        = "AWS::Redshift::ClusterParameterGroup"
  show RedshiftClusterSecurityGroup                         = "AWS::Redshift::ClusterSecurityGroup"
  show RedshiftClusterSecurityGroupIngress                  = "AWS::Redshift::ClusterSecurityGroupIngress"
  show RedshiftClusterSubnetGroup                           = "AWS::Redshift::ClusterSubnetGroup"
  show RoboMakerFleet                                       = "AWS::RoboMaker::Fleet"
  show RoboMakerRobot                                       = "AWS::RoboMaker::Robot"
  show RoboMakerRobotApplication                            = "AWS::RoboMaker::RobotApplication"
  show RoboMakerRobotApplicationVersion                     = "AWS::RoboMaker::RobotApplicationVersion"
  show RoboMakerSimulationApplication                       = "AWS::RoboMaker::SimulationApplication"
  show RoboMakerSimulationApplicationVersion                = "AWS::RoboMaker::SimulationApplicationVersion"
  show Route53HealthCheck                                   = "AWS::Route53::HealthCheck"
  show Route53HostedZone                                    = "AWS::Route53::HostedZone"
  show Route53RecordSet                                     = "AWS::Route53::RecordSet"
  show Route53RecordSetGroup                                = "AWS::Route53::RecordSetGroup"
  show Route53ResolverResolverEndpoint                      = "AWS::Route53Resolver::ResolverEndpoint"
  show Route53ResolverResolverRule                          = "AWS::Route53Resolver::ResolverRule"
  show Route53ResolverResolverRuleAssociation               = "AWS::Route53Resolver::ResolverRuleAssociation"
  show S3Bucket                                             = "AWS::S3::Bucket"
  show S3BucketPolicy                                       = "AWS::S3::BucketPolicy"
  show SageMakerEndpoint                                    = "AWS::SageMaker::Endpoint"
  show SageMakerEndpointConfig                              = "AWS::SageMaker::EndpointConfig"
  show SageMakerModel                                       = "AWS::SageMaker::Model"
  show SageMakerNotebookInstance                            = "AWS::SageMaker::NotebookInstance"
  show SageMakerNotebookInstanceLifecycleConfig             = "AWS::SageMaker::NotebookInstanceLifecycleConfig"
  show SecretsManagerResourcePolicy                         = "AWS::SecretsManager::ResourcePolicy"
  show SecretsManagerRotationSchedule                       = "AWS::SecretsManager::RotationSchedule"
  show SecretsManagerSecret                                 = "AWS::SecretsManager::Secret"
  show SecretsManagerSecretTargetAttachment                 = "AWS::SecretsManager::SecretTargetAttachment"
  show ServiceCatalogAcceptedPortfolioShare                 = "AWS::ServiceCatalog::AcceptedPortfolioShare"
  show ServiceCatalogCloudFormationProduct                  = "AWS::ServiceCatalog::CloudFormationProduct"
  show ServiceCatalogCloudFormationProvisionedProduct       = "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
  show ServiceCatalogLaunchNotificationConstraint           = "AWS::ServiceCatalog::LaunchNotificationConstraint"
  show ServiceCatalogLaunchRoleConstraint                   = "AWS::ServiceCatalog::LaunchRoleConstraint"
  show ServiceCatalogLaunchTemplateConstraint               = "AWS::ServiceCatalog::LaunchTemplateConstraint"
  show ServiceCatalogPortfolio                              = "AWS::ServiceCatalog::Portfolio"
  show ServiceCatalogPortfolioPrincipalAssociation          = "AWS::ServiceCatalog::PortfolioPrincipalAssociation"
  show ServiceCatalogPortfolioProductAssociation            = "AWS::ServiceCatalog::PortfolioProductAssociation"
  show ServiceCatalogPortfolioShare                         = "AWS::ServiceCatalog::PortfolioShare"
  show ServiceCatalogTagOption                              = "AWS::ServiceCatalog::TagOption"
  show ServiceCatalogTagOptionAssociation                   = "AWS::ServiceCatalog::TagOptionAssociation"
  show SESConfigurationSet                                  = "AWS::SES::ConfigurationSet"
  show SESConfigurationSetEventDestination                  = "AWS::SES::ConfigurationSetEventDestination"
  show SESReceiptFilter                                     = "AWS::SES::ReceiptFilter"
  show SESReceiptRule                                       = "AWS::SES::ReceiptRule"
  show SESReceiptRuleSet                                    = "AWS::SES::ReceiptRuleSet"
  show SESTemplate                                          = "AWS::SES::Template"
  show SDBDomain                                            = "AWS::SDB::Domain"
  show SNSSubscription                                      = "AWS::SNS::Subscription"
  show SNSTopic                                             = "AWS::SNS::Topic"
  show SNSTopicPolicy                                       = "AWS::SNS::TopicPolicy"
  show SQSQueue                                             = "AWS::SQS::Queue"
  show SQSQueuePolicy                                       = "AWS::SQS::QueuePolicy"
  show StepFunctionsActivity                                = "AWS::StepFunctions::Activity"
  show StepFunctionsStateMachine                            = "AWS::StepFunctions::StateMachine"
  show SSMAssociation                                       = "AWS::SSM::Association"
  show SSMDocument                                          = "AWS::SSM::Document"
  show SSMMaintenanceWindow                                 = "AWS::SSM::MaintenanceWindow"
  show SSMMaintenanceWindowTarget                           = "AWS::SSM::MaintenanceWindowTarget"
  show SSMMaintenanceWindowTask                             = "AWS::SSM::MaintenanceWindowTask"
  show SSMParameter                                         = "AWS::SSM::Parameter"
  show SSMPatchBaseline                                     = "AWS::SSM::PatchBaseline"
  show SSMResourceDataSync                                  = "AWS::SSM::ResourceDataSync"
  show WAFByteMatchSet                                      = "AWS::WAF::ByteMatchSet"
  show WAFIPSet                                             = "AWS::WAF::IPSet"
  show WAFRule                                              = "AWS::WAF::Rule"
  show WAFSizeConstraintSet                                 = "AWS::WAF::SizeConstraintSet"
  show WAFSqlInjectionMatchSet                              = "AWS::WAF::SqlInjectionMatchSet"
  show WAFWebACL                                            = "AWS::WAF::WebACL"
  show WAFXssMatchSet                                       = "AWS::WAF::XssMatchSet"
  show WAFRegionalByteMatchSet                              = "AWS::WAFRegional::ByteMatchSet"
  show WAFRegionalIPSet                                     = "AWS::WAFRegional::IPSet"
  show WAFRegionalRule                                      = "AWS::WAFRegional::Rule"
  show WAFRegionalSizeConstraintSet                         = "AWS::WAFRegional::SizeConstraintSet"
  show WAFRegionalSqlInjectionMatchSet                      = "AWS::WAFRegional::SqlInjectionMatchSet"
  show WAFRegionalWebACL                                    = "AWS::WAFRegional::WebACL"
  show WAFRegionalWebACLAssociation                         = "AWS::WAFRegional::WebACLAssociation"
  show WAFRegionalXssMatchSet                               = "AWS::WAFRegional::XssMatchSet"
  show WorkSpacesWorkspace                                  = "AWS::WorkSpaces::Workspace"

instance ToJSON ServiceType
