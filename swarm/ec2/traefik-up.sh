set -e # exit when any command fails
KEY=$1

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=ec2
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/traefik.docker-compose.yml"
docker-compose --project-directory . --env-file swarm/$CLUSTER/.env -f swarm/traefik/docker-compose.yml config > $TEMP_COMPOSE 

# docker secret create ssl-certificate-cert.pem docker-localhost-cert.pem
# docker secret create ssl-certificate-key.pem swarm/$CLUSTER/docker-localhost-key.pem
# docker config create traefik-config-dynamic.yml swarm/traefik/dynamic.yml

scp -i $KEY $TEMP_COMPOSE ubuntu@demo.greeter.xpqf.net:.
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo docker network create --driver=overlay traefik-network
sudo docker stack deploy -c traefik.docker-compose.yml traefik
EOF

echo traefik deployed to https://traefik.demo.greeter.xpqf.net

