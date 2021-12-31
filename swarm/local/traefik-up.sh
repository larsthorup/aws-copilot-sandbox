set -e # exit when any command fails

docker network create --driver=overlay traefik-public

# Note: create docker-compose.yml file including dynamic info per environment 
TEMP_COMPOSE="swarm/temp/traefik.docker-compose.yml"
docker-compose --project-directory . --env-file swarm/local/.env -f swarm/traefik/docker-compose.yml config > $TEMP_COMPOSE 
docker stack deploy -c ${TEMP_COMPOSE} traefik
