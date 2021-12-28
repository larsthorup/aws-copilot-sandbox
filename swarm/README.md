# Local deploy (Docker Swarm

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local deploy with Docker Swarm

```bash
docker swarm init
docker build
docker stack deploy -c greet.stack.yml greet
docker stack list
docker stack services greet
docker service greet_api logs
docker stack rm greet
```
