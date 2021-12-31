# ec2 - virtual machine to host demo environments

## Preconditions

- AWS IAM account configured and selected in AWS_PROFILE
- AWS region configured in AWS_REGION (eu-central-1)
- (Git) Bash
- AWS CLI installed
- AWS Route53 domain (required for HTTPS, using demo.greeter.xpqf.net below)

Windows (Git Bash):

```bash
export MSYS2_ARG_CONV_EXCL="*"
```

```bash
aws ec2 create-key-pair --key-name greet-ec2-key --query "KeyMaterial" --output text > ~/.ssh/greet-ec2-key.pem
chmod 400 ~/.ssh/greet-ec2-key.pem
# aws ec2 import-key-pair --key-name "greet-ec2-key" --public-key-material fileb://~/.ssh/id_rsa.pub
aws ec2 describe-key-pairs
aws ec2 delete-key-pair --key-name greet-ec2-key
rm -rf ~/.ssh/greet-ec2-key.pem
```

## Create virtual machine with Ubuntu Linux

```bash
aws cloudformation create-stack --stack-name greet-demo-ec2 --template-body file://swarm/ec2/ec2.cfn.yml
aws cloudformation describe-stacks --stack-name greet-demo-ec2
aws cloudformation describe-stack-events --stack-name greet-demo-ec2
aws cloudformation describe-stack-resources --stack-name greet-demo-ec2
aws cloudformation wait stack-create-complete --stack-name greet-demo-ec2
ssh -i ~/.ssh/greet-ec2-key.pem ubuntu@demo.greeter.xpqf.net "uname -a"
sh swarm/ec2/set-hostname.sh ~/.ssh/greet-ec2-key.pem
sh swarm/ec2/upgrade-packages.sh ~/.ssh/greet-ec2-key.pem
```

To delete the instance:

```bash
GREET_DEMO_STACK_ID=$(aws cloudformation describe-stacks --stack-name greet-demo-ec2 --query 'Stacks[0].StackId' --output text)
aws cloudformation delete-stack --stack-name greet-demo-ec2
aws cloudformation wait stack-delete-complete --stack-name ${GREET_DEMO_STACK_ID}
```

## Install Docker

```bash
sh swarm/ec2/install-docker.sh ~/.ssh/greet-ec2-key.pem
```

## Install Traefik

```bash
sh swarm/ec2/install-traefik.sh ~/.ssh/greet-ec2-key.pem
```

## TODO

- traefik: access docker swarm remotely
- traefik: secure remote docker swarm access
- traefik: https
- Amazon Linux and UserData?
- {up,down}.sh
