GREET_DEMO_STACK_ID=$(aws cloudformation describe-stacks --stack-name greet-demo-ec2 --query 'Stacks[0].StackId' --output text)
aws cloudformation delete-stack --stack-name greet-demo-ec2
aws cloudformation wait stack-delete-complete --stack-name ${GREET_DEMO_STACK_ID}
