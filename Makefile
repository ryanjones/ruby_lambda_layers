
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
	bundle install --path layer/ && \
	make aws_s3_sync && \
	make aws_package && \
	make aws_deploy 

aws_destroy_stack:
	aws cloudformation delete-stack --stack-name ruby-lambda-layers

aws_s3_sync:
	rm dist/layer1.zip || true && \
	cd layer; zip -r ../layer/layer1.zip *; cd .. && \
	mv layer/layer1.zip dist && \
	aws s3 sync './dist' "s3://ruby-deploy" --acl 'public-read'
