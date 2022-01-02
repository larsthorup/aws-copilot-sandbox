set -e # exit when any command fails

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=local
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/traefik.docker-compose.yml"
docker-compose --project-directory . --env-file swarm/$CLUSTER/.env -f swarm/traefik/docker-compose.yml config > $TEMP_COMPOSE 

echo -n "Creating secret ssl-certificate-cert.pem: "
docker secret create ssl-certificate-cert.pem swarm/$CLUSTER/cert/docker-localhost-cert.pem
echo -n "Creating secret ssl-certificate-key.pem: "
docker secret create ssl-certificate-key.pem swarm/$CLUSTER/cert/docker-localhost-key.pem
echo -n "Creating config traefik-config-dynamic.yml: "
docker config create traefik-config-dynamic.yml swarm/traefik/dynamic.yml
echo -n "Creating network traefik-network: "
docker network create --driver=overlay traefik-network
docker stack deploy -c ${TEMP_COMPOSE} traefik
echo
echo traefik deployed to https://traefik.docker.localhost
