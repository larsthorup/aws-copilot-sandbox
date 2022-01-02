set -e # exit when any command fails

export $(grep -v '^#' swarm/local/.env | xargs)
TEMP_COMPOSE="swarm/local/temp/docker-compose.yml"
mkdir -p swarm/local/temp

# Note: create docker-compose.yml file including dynamic info per stack and environment
docker-compose --project-directory . --env-file swarm/local/.env -f docker-compose.yml config > $TEMP_COMPOSE 
docker-compose -f $TEMP_COMPOSE build
docker-compose -f $TEMP_COMPOSE push