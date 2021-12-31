set -e # exit when any command fails

docker stack rm traefik
docker network rm traefik-public