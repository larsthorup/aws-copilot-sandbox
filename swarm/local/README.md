# Local deploy (Docker Swarm)

## Prerequisites

- Docker (Desktop)
- (Git) Bash
- [mkcert](https://github.com/FiloSottile/mkcert)

```bash
docker swarm init
mkcert -install # as root / administrator
mkcert -cert-file swarm/local/cert/cert.pem -key-file swarm/local/cert/key.pem "docker.localhost" "*.docker.localhost"
openssl x509 -in swarm/local/cert/cert.pem -text
```

Reverse proxy:

```bash
swarm/local/traefik-up.sh
docker service logs traefik_traefik
```

Registry

```bash
docker-compose -f swarm/registry/docker-compose.yml up -d
docker logs registry_registry_1
```

Teardown:

```bash
docker-compose -f swarm/registry/docker-compose yml down
swarm/local/traefik-down.sh
docker swarm leave --force
```

## Build & deploy

```bash
docker-compose build
docker login
docker-compose push
swarm/local/up.sh greet
docker stack list
docker stack services greet
docker service logs greet_api
docker stack rm greet
```

## Notes

- `services.db.ports` is deliberately not set on public environments
- `services.*.depends_on` does not work when piping `config` to `stack`
  - Open fix: https://github.com/docker/cli/issues/2365
  - Workaround: https://github.com/docker/compose/issues/7773#issuecomment-886129165
- traefik routes http from `{api,app}.${STACK}.${SWARM_HOST}` to service
- app references `${STACK}-api.${SWARM_HOST}` instead of explicit port
- wildcard certificates (mkcert) only goes one level deep, so we use greet-app instead of app.greet
