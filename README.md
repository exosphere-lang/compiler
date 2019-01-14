# Exosphere

A high level CloudFormation language and compiler.

> The exosphere is the uppermost region of Earth's atmosphere as it gradually fades into the vacuum of space.

The goal Exosphere is to simplify the creation of CloudFormation templates. Exosphere is capable of turning `exo` files into CloudFormation templates, `exo` files are parsed and checked to ensure any generated CloudFormation is valid.

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
