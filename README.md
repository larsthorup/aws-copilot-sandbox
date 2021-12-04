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

## Local build and deploy

```bash
sh build local
docker-compose up --build
```

## Local watch

TODO

## Live build and deploy

First time creation of infrastructure

```bash
copilot app init greeter
copilot env init --name test --default-config --profile $AWS_PROFILE
copilot svc init --name app --svc-type "Load Balanced Web Service" --dockerfile app/Dockerfile
```

Deploy latest code:

```bash
sh build test
copilot svc deploy --name app --env test
```

Monitor:

```bash
copilot svc logs --name app
```

## TODO

- Api
- Db
- Migration for db
- CI/CD Pipeline
- Dev (watch) mode for app
- Dev (watch) mode for api
