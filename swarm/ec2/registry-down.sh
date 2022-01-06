set -e # exit when any command fails
KEY=$1

ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo docker stack rm registry || true
EOF
