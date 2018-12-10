# AWS Lambda Layers

Working POC for loading in libraries from a lambda layer

## Installation
1. ```Update S3 bucket in template.yaml (ruby-deploy)```
2. ```make aws_launch```

### Documentation

- https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-using
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-template.html
- Layers don't seem to be hashed like lambdas (not sure why that's the case). Need to rotate the zip name in Makefile and template.yaml to update contents.