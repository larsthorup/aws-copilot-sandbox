set -e # exit when any command fails

docker stack rm traefik || true
docker network rm traefik-network || true
docker config rm traefik-config-dynamic.yml traefik-config-static.yml || true
docker secret rm ssl-certificate-cert.pem ssl-certificate-key.pem || true
