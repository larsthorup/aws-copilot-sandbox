# Local deploy (Docker Compose)

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local dev and deploy with Docker Compose

```bash
docker-compose --env-file .env.local up --build
docker-compose --env-file .env.local down
```

Open http://localhost:8080/

TODO: watch mode
