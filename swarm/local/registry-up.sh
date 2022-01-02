set -e # exit when any command fails

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=local
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/registry.docker-compose.yml"
docker-compose --project-directory . --env-file swarm/$CLUSTER/.env -f swarm/registry/docker-compose.yml config > $TEMP_COMPOSE 

docker stack deploy -c ${TEMP_COMPOSE} registry

echo docker registry deployed to https://registry.docker.localhost
