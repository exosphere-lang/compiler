# The Exosphere compiler

[![Build Status](https://travis-ci.com/exosphere-lang/compiler.svg?branch=master)](https://travis-ci.com/exosphere-lang/compiler)

A high level AWS CloudFormation language and compiler.

> The exosphere is the uppermost region of Earth's atmosphere as it gradually fades into the vacuum of space.

The goal of Exosphere is to simplify the creation of Amazon Web Service CloudFormation templates and create useful compile-time feedback to the user. Exosphere is capable of turning `exo` files into CloudFormation templates, `exo` files are parsed and checked to ensure any generated CloudFormation is valid.

Input `ExploreGitHubArtifacts.exo`:

```
ExploreGithubArtifacts S3
```

Output `explore-github-artifacts.json`

```json
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Resources": {
        "ExploreGithubArtifacts": {
            "Type": "AWS::S3::Bucket",
        }
    }
}
```

## Stability

The Exosphere grammar is still subject to change, using Exosphere in production isn't recomended at this time.

## Examples

Examples can be found at [exosphere-lang/examples](https://github.com/exosphere-lang/examples). All example source code can be compiled into valid CloudFormation JSON.

## Grammar

You can find the formal grammar for Exosphere at [exosphere-lang/grammar](https://github.com/exosphere-lang/grammar).

## Contributing

Contributions are considered, please raise a pull request or an issue.
