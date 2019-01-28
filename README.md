# The Exosphere Compiler

[![Build Status](https://travis-ci.com/exosphere-lang/compiler.svg?branch=master)](https://travis-ci.com/exosphere-lang/compiler)

A high level AWS CloudFormation language and compiler.

> The exosphere is the uppermost region of Earth's atmosphere as it gradually fades into the vacuum of space.

The goal of Exosphere is to simplify the creation of Amazon Web Service CloudFormation templates and create useful compile-time feedback to the user. Exosphere is capable of turning `exo` files into CloudFormation templates, `exo` files are parsed and checked to ensure any generated CloudFormation is valid.

### Table of Contents
1. [Getting started](#getting_started)
2. [Stability](#stability)
3. [Examples](#examples)
4. [Documentation](#documentation)
    1. [Comments](#comments)
    2. [Supported CloudFormation Types](#supported_cloudFormation_types)
5. [Examples](#examples)
6. [Grammar](#grammar)
7. [Contributing](#contributing)


## Getting started <a name="getting_started"></a>

Build Exosphere from source:

```shell
$ git clone git@github.com:exosphere-lang/compiler.git && cd compiler
$ stack build --copy-bins
```

Ensure that the executable generate from stack build is in your `$PATH`.

Create a valid Exosphere file such as `ExosphereBucket.exo`:

```
// Create a new S3 bucket with a random name
ExosphereBucket S3
```

Run `exospherec` on the input file:

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
        }
    }
}
```

Finally, upload to AWS CloudFormation and create your stack!

## Stability  <a name="stability"></a>

The Exosphere grammar is still subject to change, using Exosphere in production isn't recomended at this time.

## Documentation  <a name="documentation"></a>

### Comments <a name="comments"></a>

Comments are single line only denoted by two slashes at the beginning of a declaration, e.g:

```
// Bucket for website assets
MyWebsiteAssets S3
```

### Supported CloudFormation Types  <a name="supported_cloudFormation_types"></a>

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
