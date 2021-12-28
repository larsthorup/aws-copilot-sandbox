# Local deploy (Docker Swarm

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local deploy with Docker Swarm

```bash
docker swarm init
docker build
docker-compose --env-file .env.demo -f greet.demo.stack.yml config | docker stack deploy --compose-file - greet
docker stack list
docker stack services greet
docker service greet_api logs
docker stack rm greet
```
