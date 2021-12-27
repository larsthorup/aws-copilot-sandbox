# aws-copilot-sandbox

Docker-based development environment and deployment pipeline

Services:

- [x] DNS and certificate (HTTPS URL)
- [x] App (HTML web UI)
- [x] API (HTTP web service)
- [x] DB (SQL database)
- [x] Logs
- [x] Secrets (AWS, DB)

Workflows:

- [x] [Local deploy (Docker Compose)](./compose/README.md)
- [x] [Local deploy (Docker Swarm)](./swarm/README.md)
- [x] [Live deploy (AWS Copilot)](./copilot/README.md)
- [ ] [Sandbox deploy (Docker Swarm)](./swarm/README.md)
- [ ] Live deploy (Kubernetes)

## TODO

- CI/CD Pipeline
- linting of infrastructure code files (docker-compose config)
- e2e test of deployment
- DB for copilot
- Migration for db
- port assignment for multiple stack instances on swarm
- live telemetry
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- Recreate db command
- devcontainer.json for vscode
- Metrics for build time / deploy time / watch CPU usage
- Deploy to Docker Swarm
- Deploy to Kubernetes
