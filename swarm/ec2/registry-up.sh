set -e # exit when any command fails
KEY=$1

# Note: create docker-compose.yml file including dynamic info per environment 
CLUSTER=ec2
TEMP_DIR=swarm/$CLUSTER/temp
mkdir -p $TEMP_DIR
TEMP_COMPOSE="$TEMP_DIR/registry.docker-compose.yml"
cat \
  swarm/$CLUSTER/registry/docker-compose.yml \
  swarm/registry/docker-compose.yml \
| docker-compose \
  --project-directory . \
  --env-file swarm/$CLUSTER/.env \
  -f - \
  config \
> $TEMP_COMPOSE 

scp -i $KEY $TEMP_COMPOSE ubuntu@demo.greeter.xpqf.net:.
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << EOF
sudo docker stack deploy -c registry.docker-compose.yml registry
EOF

echo docker registry deployed to https://registry.demo.greeter.xpqf.net/v2/_catalog
