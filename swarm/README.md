# Local deploy (Docker Swarm

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local deploy with Docker Swarm

```bash
docker swarm init
docker build
docker stack deploy --compose-file=docker-compose.yml greet
docker stack list
docker stack services greet
docker service greet_api logs
docker stack rm greet
```
