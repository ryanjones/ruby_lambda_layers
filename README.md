# AWS Lambda Layers

Working POC for loading in libraries from a lambda layer

### Documentation

- https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-using
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-template.html
- Layers don't seem to be hashed like lambdas (not sure why that's the case). Need to rotate the zip name in Makefile and template.yaml to update contents.