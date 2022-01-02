set -e # exit when any command fails

docker stack rm traefik
docker network rm traefik-network
docker config rm traefik-config-dynamic.yml
docker secret rm ssl-certificate-cert.pem
docker secret rm ssl-certificate-key.pem
