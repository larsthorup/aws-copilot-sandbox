# aws-copilot-sandbox

Docker-based development environment and deployment pipeline

Services:

1. App (HTML front-end)

Workflows:

- Local deploy

## Prerequisites

- Docker
- Bash
- AWS account configured and selected in AWS_PROFILE
- AWS Copilot CLI

## Local deploy

```bash
docker-compose up --build
```

## Live deploy

First time creation of infrastructure

```bash
copilot app init greeter
copilot env init --name test --default-config --profile $AWS_PROFILE
copilot svc init --name app --svc-type "Load Balanced Web Service" --dockerfile app/Dockerfile
```

Deploy latest code:

```bash
copilot svc deploy --name app --env test
```

Monitor:

```bash
copilot svc logs --name app
```

## TODO

- Api
- Db
- Observability
- Dev (watch) mode for app
- Dev (watch) mode for api
- Live deploy
- CI/CD Pipeline
