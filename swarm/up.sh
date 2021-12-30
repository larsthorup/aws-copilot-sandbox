export STACK=$1
TEMP_DOTENV=swarm/temp/.env.${STACK}
TEMP_COMPOSE=swarm/temp/${STACK}.docker-compose.yml
mkdir -p swarm/temp

# Note: create .env file including dynamic info per stack
cat swarm/.env > $TEMP_DOTENV
echo "DEPLOY_ENV=${STACK}-demo" >> $TEMP_DOTENV
echo "APP_ORIGIN=http://app.${STACK}.localhost" >> $TEMP_DOTENV
echo "API_ORIGIN=http://api.${STACK}.localhost" >> $TEMP_DOTENV

# Note: create docker-compose.yml file including dynamic info per stack
docker-compose --project-directory . --env-file $TEMP_DOTENV -f swarm/docker-compose.yml config > $TEMP_COMPOSE 
docker stack deploy --compose-file $TEMP_COMPOSE ${STACK}
