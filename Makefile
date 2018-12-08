
aws_package:
	aws cloudformation package \
	--template-file './template.yaml' \
	--s3-bucket ruby-deploy \
	--output-template-file './cloudformation-output.yaml'

aws_deploy: 
	aws cloudformation deploy \
	--template-file './cloudformation-output.yaml' \
	--capabilities 'CAPABILITY_NAMED_IAM' \
	--stack-name ruby-lambda-layers

aws_launch:
	make aws_s3_sync && \
	make aws_package && \
	make aws_deploy 

aws_destroy_stack:
	aws cloudformation delete-stack --stack-name ruby-lambda-layers

aws_s3_sync:
	rm -rf layer/ruby && \
	bundle install --path layer/ --deployment && \
	rm -rf dist/* || true && \
	mkdir -p layer/ruby/gems/2.5.0 && \
	mv layer/ruby/2.5.0/gems/* layer/ruby/gems/2.5.0 || true && \
	rm -rf layer/ruby/2.5.0 && \
	cd layer; zip -r0 layer9.zip .; cd .. && \
	mv layer/layer9.zip dist || true && \
	aws s3 sync './dist' "s3://ruby-deploy" --acl 'public-read'
