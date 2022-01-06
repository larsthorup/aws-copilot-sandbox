set -e # exit when any command fails
KEY=$1

ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo docker stack rm traefik || true
sudo docker network rm traefik-network || true
sudo docker config rm traefik-config-dynamic.yml traefik-config-static.yml || true
EOF
