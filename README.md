< Currently not working >

Lambda is still not seeing ruby gems

- https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-using
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-template.html

- Layers don't seem to be hashed like lambdas (not sure why that's the case)


### Working Lambda layer load:

$LOAD_PATH << '/opt/ruby/gems/2.5.0/awesome_print-1.8.0/lib'

require 'ap'

def hello(event:, context:)
    { 
        gems: "#{Dir.entries('/opt/ruby/gems/2.5.0')}",
        load_path: $LOAD_PATH,
        gem_path_env: "#{ENV['GEM_PATH']}",
        gem_home: "#{ENV['GEM_HOME']}",
        gem_path_env2: Gem.paths.path.join(', '),
        ruby_lib_env: "#{ENV['RUBYLIB']}",
        home: "#{ENV['HOME']}",
        #loaded: $LOADED_FEATURES
    }
end