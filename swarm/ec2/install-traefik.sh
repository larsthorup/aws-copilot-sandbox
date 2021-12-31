KEY=$1
scp -i $KEY swarm/traefik/docker-compose.yml ubuntu@demo.greeter.xpqf.net:traefik.compose.yml
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo docker network create --driver=overlay traefik-public
sudo docker stack deploy -c traefik.compose.yml traefik
EOF