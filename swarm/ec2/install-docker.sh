KEY=$1
GREET_DEMO_EC2_IP=$(aws cloudformation describe-stack-resource --stack-name greet-demo-ec2 --logical-resource-id GreetDemoEIP --query 'StackResourceDetail.PhysicalResourceId' --output text)
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo docker swarm init --advertise-addr ${GREET_DEMO_EC2_IP}
sudo docker node ls
EOF