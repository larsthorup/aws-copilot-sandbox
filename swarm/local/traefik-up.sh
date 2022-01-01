set -e # exit when any command fails

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=local
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/traefik.docker-compose.yml"
docker-compose --project-directory . --env-file swarm/$CLUSTER/.env -f swarm/traefik/docker-compose.yml config > $TEMP_COMPOSE 

docker network create --driver=overlay traefik-public
docker stack deploy -c ${TEMP_COMPOSE} traefik

echo traefik deployed to https://traefik.docker.localhost
