# aws-copilot-sandbox

Docker-based development environment and deployment pipeline

Services:

1. App (HTML front-end)

Workflows:

- Local deploy
- Live deploy

## Local prerequisites

- Docker (Desktop)
- (Git) Bash

## Local build and deploy

```bash
sh build.sh local
docker-compose up --build
```

Open http://localhost:8081/

## Local watch

TODO

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
copilot env init --name test --default-config --profile $AWS_PROFILE
```

Deploy latest code:

```bash
sh build.sh test
copilot svc deploy --name api --env test
copilot svc deploy --name app --env test
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

- Db
- Migration for db
- e2e test
- CI/CD Pipeline
- Dev (watch) mode for app
- Dev (watch) mode for api
