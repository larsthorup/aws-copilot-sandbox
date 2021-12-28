# docker-sandbox

Docker-based development environment and deployment pipeline

Services:

- [x] DNS and certificate (HTTPS URL)
- [x] [App (HTML web UI)](./app/README.md)
- [x] API (HTTP web service)
- [x] DB (SQL database)
- [x] Logs
- [x] Secrets (AWS, DB)

Environments:

- [x] local: [Local deploy (Docker Compose)](./compose/README.md)
- [x] demo-local: [Local deploy (Docker Swarm)](./swarm/README.md)
- [x] live: [Live deploy (AWS Copilot)](./copilot/README.md)
- [ ] demo-xyz: [Sandbox deploy (Docker Swarm)](./swarm/README.md)
- [ ] Live deploy (Kubernetes)

```bash
docker-compose up --build
```

## TODO

- api: inject external port numbers (random/assigned) and external hostname (derived from environment name)
- generate port for multiple stack instances on swarm
- api: use internal hostname for internal hosts (db)
- traefik to route from host name to stack instance
- Deploy to Docker Swarm
- CI/CD Pipeline (requires docker swarm host for review environments)
- prettify: sh, Dockerfile, yaml
- linting of infrastructure code files (docker-compose config)
- e2e test of deployment
- avoid the need for specifying DEPLOY_ENV in .env-file
- DB for copilot
- Migration for db
- live telemetry
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- Recreate db command
- devcontainer.json for vscode
- app: vite bundler
- Metrics for build time / deploy time / watch CPU usage
- Deploy to Kubernetes
