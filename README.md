# The Exosphere compiler

[![Build Status](https://travis-ci.com/exosphere-lang/compiler.svg?branch=master)](https://travis-ci.com/exosphere-lang/compiler)

A high level AWS CloudFormation language and compiler.

> The exosphere is the uppermost region of Earth's atmosphere as it gradually fades into the vacuum of space.

The goal of Exosphere is to simplify the creation of Amazon Web Service CloudFormation templates and create useful compile-time feedback to the user. Exosphere is capable of turning `exo` files into CloudFormation templates, `exo` files are parsed and checked to ensure any generated CloudFormation is valid.

## Getting started

Build Exosphere from source:

```shell
$ git clone git@github.com:exosphere-lang/compiler.git && cd compiler
$ stack build --copy-bins
```

Ensure that the executable generate from stack build is in your `$PATH`.

Create a valid Exosphere file such as `ExosphereBucket.exo`:

```
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

## Stability

The Exosphere grammar is still subject to change, using Exosphere in production isn't recomended at this time.

## Examples

Examples can be found at [exosphere-lang/examples](https://github.com/exosphere-lang/examples). All example source code can be compiled into valid CloudFormation JSON.

## Grammar

You can find the formal grammar for Exosphere at [exosphere-lang/grammar](https://github.com/exosphere-lang/grammar).

## Contributing

Contributions are considered, please raise a pull request or an issue.
