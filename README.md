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

- swarm: get rid of warnings (unsupport "build", deprecated "container_name")
- traefik to route tcp from `db.${STACK}.localhost` to service
- traefik network - create in docker-compose
- traefik https
- deploy demo environments on cloud hosted docker swarm
- CI/CD Pipeline (requires docker swarm host for review environments)
- prettify: yaml
- linting of infrastructure code files (docker-compose config)
  - https://github.com/replicatedhq/dockerfilelint
  - https://github.com/koalaman/shellcheck
- e2e test of deployment
- DB for copilot
- Migration for db
- live telemetry
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- Recreate db command
- devcontainer.json for vscode
- app: vite bundler
- .env: remove duplication
- Metrics for build time / deploy time / watch CPU usage
- Deploy to Kubernetes
