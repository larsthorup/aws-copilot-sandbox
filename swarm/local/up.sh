set -e # exit when any command fails

export $(grep -v '^#' swarm/local/.env | xargs)
export STACK="$1"
APP_ORIGIN="https://${STACK}-app.${SWARM_HOST}"
API_ORIGIN="https://${STACK}-api.${SWARM_HOST}"
TEMP_DOTENV="swarm/local/temp/.env.${STACK}"
TEMP_COMPOSE="swarm/local/temp/${STACK}.docker-compose.yml"
mkdir -p swarm/local/temp

# Note: create .env file including dynamic info per stack
cat swarm/.env > $TEMP_DOTENV
echo "DEPLOY_ENV=${STACK}-demo" >> $TEMP_DOTENV
echo "APP_ORIGIN=${APP_ORIGIN}" >> $TEMP_DOTENV
echo "API_ORIGIN=${API_ORIGIN}" >> $TEMP_DOTENV

# Note: create docker-compose.yml file including dynamic info per stack and environment
docker-compose --project-directory . --env-file $TEMP_DOTENV -f swarm/docker-compose.yml config > $TEMP_COMPOSE 
docker stack deploy --compose-file $TEMP_COMPOSE ${STACK}

echo Stack \"${STACK}\" deployed to ${APP_ORIGIN}