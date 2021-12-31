KEY=$1
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo apt update
sudo apt upgrade -y
EOF
