# Local deploy (Docker Swarm)

## Prerequisites

- Docker (Desktop)
- (Git) Bash

```bash
docker swarm init
docker network create --driver=overlay traefik-public
docker stack deploy -c swarm/traefik/docker-compose.yml traefik
docker service logs traefik_traefik
```

```bash
docker swarm leave --force
```

## Build & deploy

```bash
docker-compose build
swarm/up.sh greet
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
- traefik routes http from `{api,app}.${STACK}.${BASE_DOMAIN}` to service
- app references `api.${STACK}.${BASE_DOMAIN}` instead of explicit port
