# aws-copilot-sandbox

Docker-based development environment and deployment pipeline

Services:

- [x] DNS and certificate (HTTPS URL)
- [x] App (HTML web UI)
- [x] API (HTTP web service)
- [x] DB (SQL database)
- [ ] Secrets (AWS, DB)

Workflows:

- [x] Local deploy (Docker Compose)
- [ ] Live deploy (AWS Copilot)
- [ ] Sandbox deploy (Docker Swarm)
- [ ] Live deploy (Kubernetes)

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local dev and deploy with Docker Compose

```bash
sh build.sh local
docker-compose up --build
docker-compose down
```

Open http://localhost:8081/

TODO: watch mode

## Local deploy with Docker Swarm

```bash
docker swarm init
docker build
docker stack deploy --compose-file=docker-compose.yml greet
docker stack rm greet
```

## Live prerequisites

- AWS IAM account configured and selected in AWS_PROFILE
- AWS Copilot CLI installed
- AWS Route53 domain (required for HTTPS, using xpqf.net below)

## Live build and deploy

First time creation of infrastructure

```bash
copilot app init greeter --domain xpqf.net
copilot svc init --name app
copilot svc init --name api
copilot storage init --name db --storage-type Aurora --workload api --engine PostgreSQL --initial-db postgres
copilot env init --name live --default-config --profile $AWS_PROFILE
```

Deploy latest code:

```bash
sh build.sh live
copilot svc deploy --name api --env live
copilot svc deploy --name app --env live
```

Open: https://greeter.xpqf.net/

Monitor:

```bash
copilot svc logs --name app
copilot svc logs --name api
```

Destroy:

```bash
copilot app delete
```

## TODO

- port assignment for multiple stack instances on swarm
- nginx for app instead of node:http-serve
- DB for copilot
- Migration for db
- linting of infrastructure code files
- e2e test of deployment
- live telemetry
- CI/CD Pipeline
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- Recreate db command
- devcontainer.json for vscode
- Metrics for build time / deploy time / watch CPU usage
- Deploy to Docker Swarm
- Deploy to Kubernetes
