set -e # exit when any command fails
KEY=$1

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=ec2
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/traefik.docker-compose.yml"
cat \
  swarm/$CLUSTER/traefik/docker-compose.yml \
  swarm/traefik/docker-compose.yml \
| docker-compose \
  --project-directory . \
  --env-file swarm/$CLUSTER/.env \
  -f - \
  config \
> $TEMP_COMPOSE 

TEMP_STATIC="$TEMP_DIR/traefik.yml"
cat swarm/$CLUSTER/traefik/traefik.yml swarm/traefik/traefik.yml | envsubst > $TEMP_STATIC

scp -i $KEY $TEMP_COMPOSE ubuntu@demo.greeter.xpqf.net:.
scp -i $KEY $TEMP_STATIC ubuntu@demo.greeter.xpqf.net:.
scp -i $KEY swarm/$CLUSTER/traefik/traefik-config-dynamic.yml ubuntu@demo.greeter.xpqf.net:.
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
echo -n "Creating config traefik-config-static.yml: "
sudo docker config create traefik-config-static.yml traefik.yml
echo -n "Creating config traefik-config-dynamic.yml: "
sudo docker config create traefik-config-dynamic.yml traefik-config-dynamic.yml
echo -n "Creating network traefik-network: "
sudo docker network create --driver=overlay traefik-network
sudo docker stack deploy -c traefik.docker-compose.yml traefik
EOF

echo traefik deployed to https://traefik.demo.greeter.xpqf.net
