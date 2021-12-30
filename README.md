# docker-sandbox

Docker-based development environment and deployment pipeline

- [x] [Local deploy (Docker Compose)](./compose/README.md)
- [x] [Local deploy (Docker Swarm)](./swarm/README.md)
- [ ] [Demo deploy (Docker Swarm)](./swarm/README.md)
- [ ] Local deploy (Kubernetes)
- [ ] Live deploy (Kubernetes)
- [x] [Live deploy (AWS Copilot)](./copilot/README.md)

Services of the application

- [x] [App (HTML web UI)](./app/README.md)
- [x] [API (HTTP web service)](./api/README.md)
- [x] DB (SQL database)

Supporting services

- [x] DNS and certificate (HTTPS URL)
- [x] Network (IP address, port)
- [x] Logs
- [ ] Secrets (hosting, certificate, db)

Environments:

- [x] local with watch
- [x] demo
- [x] live

Orchestrators:

- [ ] Physical hardware (no containerization)
- [ ] Single docker image
- [x] Docker Compose
- [x] Docker Swarm
- [ ] Kubernetes
- [x] AWS Copilot

Hosting providers:

- [ ] On premise
- [x] AWS
- [ ] Google
- [ ] Azure

Scripting language:

- [x] Bash, YML, Dockerfile, .env
- [ ] Terraform

```bash
docker-compose up --build
```

## TODO

- traefik: https
- deploy demo environments on cloud hosted docker swarm on https://${STACK}.demo.greeter.xpqf.com
- CI/CD Pipeline
- e2e test of deployment
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- traefik: route tcp from `db.${STACK}.localhost` to service
- traefik: network - create in docker-compose
- traefik: up.sh: wait until healthy
- prettify: yaml
- linting of infrastructure code files (docker-compose config)
  - https://github.com/replicatedhq/dockerfilelint
  - https://github.com/koalaman/shellcheck
- DB for copilot
- Migration for db
- live telemetry
- Recreate db command
- devcontainer.json for vscode
- app: vite bundler
- Metrics for build time / deploy time / watch CPU usage
- Deploy to Kubernetes
