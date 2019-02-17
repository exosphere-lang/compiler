module Parser.Keywords where

import Data.Map
import ServiceType (ServiceType(..))

keywordsMap :: Map String ServiceType
keywordsMap = fromList
  [
    ("S3", S3),
    ("ECSCluster", ECSCluster),
    ("ApiGatewayAccount", ApiGatewayAccount),
    ("ApiGatewayApiKey", ApiGatewayApiKey),
    ("ApiGatewayClientCertificate", ApiGatewayClientCertificate),
    ("ApiGatewayRestApi", ApiGatewayRestApi),
    ("ApiGatewayUsagePlan", ApiGatewayUsagePlan),
    ("AppStreamStack", AppStreamStack),
    ("AppSyncApiKey", AppSyncApiKey)
  ]
