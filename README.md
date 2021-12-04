# aws-copilot-sandbox

Docker-based development environment and deployment pipeline

Services:

1. App (HTML front-end)

Workflows:

- Local deploy
- Live deploy

## Prerequisites

- Docker (Desktop)
- (Git) Bash
- AWS IAM account configured and selected in AWS_PROFILE
- AWS Copilot CLI installed

## Local build and deploy

```bash
sh build.sh local
docker-compose up --build
```

## Local watch

TODO

## Live build and deploy

First time creation of infrastructure

```bash
copilot app init greeter
copilot svc init --name app
copilot svc init --name api
copilot env init --name test --default-config --profile $AWS_PROFILE
```

Deploy latest code:

```bash
sh build.sh test
copilot svc deploy --name app --env test
copilot svc deploy --name api --env test
```

Monitor:

```bash
copilot svc logs --name app
copilot svc logs --name api
```

## TODO

- DNS + HTTPS - https://github.com/kohidave/dns-and-lb-copilot-demo
- Db
- Migration for db
- e2e test
- CI/CD Pipeline
- Dev (watch) mode for app
- Dev (watch) mode for api
