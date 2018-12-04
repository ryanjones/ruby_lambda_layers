
aws_package:
	aws cloudformation package \
	--template-file './cloudformation.yaml' \
	--s3-bucket ruby-deploy \
	--output-template-file './cloudformation-output.yaml'

aws_deploy: 
	make aws_s3_sync && \
	aws cloudformation deploy \
	--template-file './cloudformation-output.yaml' \
	--capabilities 'CAPABILITY_NAMED_IAM' \
	--stack-name ruby-lambda-layers

aws_launch:
	make aws_package && \
	make aws_deploy && \
	make aws_s3_sync

aws_destroy_stack:
	aws cloudformation delete-stack --stack-name ruby-lambda-layers

aws_s3_sync:
	rm dist/lambda.zip || true && \
	rm dist/layer.zip || true && \
	zip -jrX "dist/lambda.zip" lambda && \
	zip -rX "dist/layer.zip" layer && \
	aws s3 sync './dist' "s3://ruby-deploy" --acl 'public-read'
