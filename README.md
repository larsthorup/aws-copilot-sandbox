# docker-sandbox

Docker-based development environment and deployment pipeline

Services of the application

- [x] [App (HTML web UI)](./app/README.md)
- [x] [API (HTTP web service)](./api/README.md)
- [x] DB (SQL database)

Supporting services

- [x] DNS and certificate (HTTPS URL)
- [x] Network (IP address, port)
- [x] Logs
- [x] Secrets (AWS, DB)

Environments:

- [x] local: [Local deploy (Docker Compose)](./compose/README.md)
- [x] demo-local: [Local deploy (Docker Swarm)](./swarm/README.md)
- [ ] demo-xyz: [Demo deploy (Docker Swarm)](./swarm/README.md)
- [ ] live-local: Local deploy (Kubernetes)
- [ ] live: Live deploy (Kubernetes)
- [x] live: [Live deploy (AWS Copilot)](./copilot/README.md)

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

- [x] Bash
- [ ] Terraform

```bash
docker-compose up --build
```

## TODO

- generate random port for multiple stack instances on swarm
- api: use internal hostname for internal hosts (db)
- traefik to route from host name to stack instance
- Deploy to Docker Swarm
- CI/CD Pipeline (requires docker swarm host for review environments)
- prettify: sh, Dockerfile, yaml
- linting of infrastructure code files (docker-compose config)
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
