# ec2 - virtual machine to host demo environments

## Preconditions

- AWS IAM account configured and selected in AWS_PROFILE
- AWS region configured in AWS_REGION (eu-central-1)
- (Git) Bash
- AWS CLI installed
- AWS Route53 domain (required for HTTPS, using xpqf.net below)

Windows (Git Bash):

```bash
export MSYS2_ARG_CONV_EXCL="*"
```

```bash
aws ec2 create-key-pair --key-name greet-ec2-key --query "KeyMaterial" --output text > ~/.ssh/greet-ec2-key.pem
chmod 400 ~/.ssh/greet-ec2-key.pem
# aws ec2 import-key-pair --key-name "greet-ec2-key" --public-key-material fileb://~/.ssh/id_rsa.pub
aws ec2 describe-key-pairs
```

## Create instance

```bash
aws cloudformation create-stack --stack-name greet-demo-ec2 --template-body file://ec2/ec2.cf.yml
aws cloudformation describe-stacks --stack-name greet-demo-ec2
aws cloudformation describe-stack-events --stack-name greet-demo-ec2
aws cloudformation describe-stack-resources --stack-name greet-demo-ec2
aws cloudformation wait stack-create-complete --stack-name greet-demo-ec2

export GREET_DEMO_EC2_IP=$(aws cloudformation describe-stack-resource --stack-name greet-demo-ec2 --logical-resource-id GreetDemoEIP --query 'StackResourceDetail.PhysicalResourceId' --output text)
ssh -i ~/.ssh/greet-ec2-key.pem ubuntu@${GREET_DEMO_EC2_IP}
aws cloudformation delete-stack --stack-name greet-demo-ec2
```

## TODO

- DNS: CNAME demo.greeter.xpqf.com -> ${GREET_DEMO_EC2_IP}
- hostname
- update packages
- install docker
- enable docker swarm on public ip
