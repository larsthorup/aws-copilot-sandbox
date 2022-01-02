# Deployment engineering with Docker

Development environments and delivery pipelines for demo and live environments

| environment | cluster | orchestrator | reg | dns | ssl | app | api | db  |
| ----------- | ------- | ------------ | --- | --- | --- | --- | --- | --- |
| dev         | local   | compose      | -   | -   | -   |     |     |     |
| local       | local   | compose      | -   | -   | -   | +   | +   | +   |
| demo        | local   | swarm        | +   | +   | +   | +   | +   | +   |
| demo        | AWS EC2 | swarm        |     | +   |     |     |     |     |
| live        | AWS ECS | copilot      |     | +   | +   | +   | +   |     |
| local       | local   | kubernetes   |     |     |     |     |     |     |
| live        |         | kubernetes   |     |     |     |     |     |     |

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

- deploy demo environments on cloud hosted docker swarm on https://${STACK}.${SWARM_HOST}
  - with a registry for demo environments?
    - REGISTRY_HOST
    - TAG=latest
    - docker-compose build
    - docker-compose push
    - ssh ${SWARM} "docker stack deploy"
    - docker image prune
    - https://gabrieltanner.org/blog/docker-registry
    - https://semaphoreci.com/community/tutorials/running-applications-on-a-docker-swarm-mode-cluster
    - https://geek-cookbook.funkypenguin.co.nz/ha-docker-swarm/registry/
  - build on demo
    - ssh ${SWARM} "docker-compose build"
    - not concurrency safe
  - without a registry
    - docker stack deploy ${SWARM}
    - does not appear to be an option??
- move /.env to compose/.env
- swarm/.env: GREETER_HOST=greeter.xpqf.net
- registry: authentication
- traefik: authentication
- watch mode for Docker
  - https://stackoverflow.com/questions/26050899/how-to-mount-host-volumes-into-docker-containers-in-dockerfile-during-build
  - https://vsupalov.com/rebuilding-docker-image-development/
  - https://vsupalov.com/cache-docker-build-dependencies-without-volume-mounting/
- Dev (watch) mode for app
- Dev (watch) mode for api (nodemon?)
- CI/CD Pipeline
  - TAG=${COMMIT_SHA}
  - docker-compose build
- e2e test of deployment
- EC2: Amazon Linux (over Ubuntu Linux) for better Cloudformation integration
- traefik: route tcp from `db.${STACK}.${SWARM_HOST}` to service
- traefik: up.sh: wait until healthy
- registry: up.sh: wait until healthy
- avoid "WARNING: Some services (traefik) use the 'configs' key, which will be ignored."
  - use another template mechanism than `docker-compose config`
- swarm: swarmpit - resource dashboard
- swarm: swarmprom - monitoring and alerts
- swarm: swarm deployment dashboard - https://github.com/dockersamples/docker-swarm-visualizer
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
