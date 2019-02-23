# The Exosphere Compiler

[![Build Status](https://travis-ci.com/exosphere-lang/compiler.svg?branch=master)](https://travis-ci.com/exosphere-lang/compiler)
[![Build Status](https://travis-ci.com/exosphere-lang/end-to-end-test.svg?branch=master)](https://travis-ci.com/exosphere-lang/end-to-end-test)

A high level AWS CloudFormation language and compiler.

> The exosphere is the uppermost region of Earth's atmosphere as it gradually fades into the vacuum of space.

The goal of Exosphere is to simplify the creation of Amazon Web Service CloudFormation templates and create useful compile-time feedback to the user. This should hopefully make maintaining cloudformation stacks much easier. The aim then is that exosphere is capable of turning `exo` files into CloudFormation templates and the `exo` files are parsed and validated to ensure any generated CloudFormation is valid.

### Table of Contents
1. [Getting started](#getting_started)
2. [Stability](#stability)
3. [Examples](#examples)
4. [Documentation](#documentation)
    1. [Format](#format)
    1. [Comments](#comments)
    2. [Supported CloudFormation Types](#supported_cloudFormation_types)
5. [Examples](#examples)
6. [Grammar](#grammar)
7. [Contributing](#contributing)


## Getting started <a name="getting_started"></a>

Build Exosphere from source:

```shell
git clone git@github.com:exosphere-lang/compiler.git && cd compiler
stack build --copy-bins
```

Ensure that the executable generate from stack build is in your `$PATH`.

Create a valid Exosphere file such as `ExosphereBucket.exo`:

```
ExosphereBucket S3
FamilyPhotosBackup S3 { AccessControl Private }
```

Run `exospherec` on the input file. This will create a template for creating a new S3 bucket with the name `ExosphereBucket`, and one with the access properties.

```shell
$ exospherec ./ExosphereBucket.exo
```

Inspect the generated CloudFormation template `ExosphereBucket.exo.json`

```json
$ cat ./ExosphereBucket.exo.json
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Resources": {
        "ExosphereBucket": {
            "Type": "AWS::S3::Bucket",
        },
        "FamilyPhotosBackup": {
            "Type": "AWS::S3::Bucket",
            "Properties": {
                "AccessControl": "Private",
            }
        }
    }
}
```

Finally, upload to AWS CloudFormation to create your stack!

## Stability <a name="stability"></a>

The Exosphere grammar is still subject to change, using Exosphere in production isn't recomended at this time.

## Documentation <a name="documentation"></a>

### Format <a name="format"></a>

The format for an exosphere (.exo) file is:

```resource_name resource_type { propKey1 propValue1, propKey2 propValue2, ... }```

The properties are optional. If you omit them, then the brackets are not needed. If you include properties, then the brackets are required. However, the brackets and properties can span multiple lines. Please see the table below for more details

| key | description | sample |
| --- | --- | -- |
| resource_name | The name you want the cloud formation resource to have | MyResource, FestivePictures, MyWebiste, etc |
| resource_type | The service you want to use - corresponds to the AWS::xx::xx format | EC2, S3, Lambda, etc |
| properties | The properties you want the resource to have - seperated by a comma, where each key and value is seperated by whitespace |  |

Putting this together, you will have something like:

```MyS3Bucket S3```

which will create an S3 bucket called `MyS3Bucket`.

### Comments <a name="comments"></a>

Comments are single line only denoted by two slashes at the beginning of a declaration, e.g:

```
// Bucket for website assets
MyWebsiteAssets S3
```

### Currently Supported CloudFormation Types  <a name="supported_cloudFormation_types"></a>

| CloudFormation | Exosphere |
| --- | --- |
| AWS::S3::Bucket | S3 |
| AWS::ECS::Cluster | ECSCluster |
| AWS::ApiGateway::Account | ApiGatewayAccount |
| AWS::ApiGateway::ApiKey | ApiGatewayApiKey |
| AWS::ApiGateway::ClientCertificate | ApiGatewayClientCertificate |
| AWS::ApiGateway::RestApi | ApiGatewayRestApi |
| AWS::ApiGateway::UsagePlan | ApiGatewayUsagePlan |
| AWS::AppStream::Stack | AppStreamStack |
| AWS::AppSync::ApiKey | AppSyncApiKey |

## Examples  <a name="examples"></a>

Examples can be found at [exosphere-lang/examples](https://github.com/exosphere-lang/examples). All example source code can be compiled into valid CloudFormation JSON.

## Grammar  <a name="grammar"></a>

You can find the formal grammar for Exosphere at [exosphere-lang/grammar](https://github.com/exosphere-lang/grammar).

## Contributing  <a name="contributing"></a>

Contributions are considered, please raise a pull request or an issue.
