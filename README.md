< Currently not working >

Lambda is still not seeing ruby gems

- https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-using
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-template.html

- Layers don't seem to be hashed like lambdas (not sure why that's the case)

debugging ->
ENV['GEM_PATH'] = "/var/task/vendor/bundle/ruby/2.5.0:/opt/ruby/gems/2.5.0"