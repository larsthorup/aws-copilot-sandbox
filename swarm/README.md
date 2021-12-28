# Local deploy (Docker Swarm)

## Prerequisites

- Docker (Desktop)
- (Git) Bash

```bash
docker swarm init
```

## Build & deploy

```bash
docker-compose build
(export DEMO_ENV=greet && mkdir -p swarm/temp && echo "DEPLOY_ENV=${DEMO_ENV}-demo" | cat - swarm/.env.${DEMO_ENV} swarm/.env > swarm/temp/.env.${DEMO_ENV})
(export DEMO_ENV=greet && docker-compose --project-directory . --env-file swarm/temp/.env.${DEMO_ENV} -f swarm/docker-compose.yml config | docker stack deploy --compose-file - ${DEMO_ENV})
docker stack list
docker stack services greet
docker service greet_api logs
docker stack rm greet
```

## Notes

- `services.db.ports` is deliberately not set on public environments
