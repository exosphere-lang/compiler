module Parser.Keywords where

import Data.Map
import ServiceType (ServiceType(..))

keywordsMap :: Map String ServiceType
keywordsMap = fromList
  [
    ("S3Bucket", S3Bucket),
    ("ECSCluster", ECSCluster),
    ("ApiGatewayAccount", ApiGatewayAccount),
    ("ApiGatewayApiKey", ApiGatewayApiKey),
    ("ApiGatewayClientCertificate", ApiGatewayClientCertificate),
    ("ApiGatewayRestApi", ApiGatewayRestApi),
    ("ApiGatewayUsagePlan", ApiGatewayUsagePlan),
    ("AppStreamStack", AppStreamStack),
    ("AppSyncApiKey", AppSyncApiKey)
  ]
