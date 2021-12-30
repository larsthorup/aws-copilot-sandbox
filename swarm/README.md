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

## Build & deploy

```bash
docker-compose build
(export STACK=greet && mkdir -p swarm/temp && echo "DEPLOY_ENV=${STACK}-demo" | cat - swarm/.env > swarm/temp/.env.${STACK} && echo "APP_ORIGIN=http://app.${STACK}.localhost" >> swarm/temp/.env.${STACK} && echo "API_ORIGIN=http://api.${STACK}.localhost" >> swarm/temp/.env.${STACK})
(export STACK=greet && docker-compose --project-directory . --env-file swarm/temp/.env.${STACK} -f swarm/docker-compose.yml config > swarm/temp/${STACK}.docker-compose.yml && docker stack deploy --compose-file swarm/temp/${STACK}.docker-compose.yml ${STACK})
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
- traefik routes http from `{api,app}.${STACK}.localhost` to service
- app references `api.${STACK}.localhost` instead of explicit port
