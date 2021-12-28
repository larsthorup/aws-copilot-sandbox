# Live deploy (AWS Copilot)

## Live prerequisites

- AWS IAM account configured and selected in AWS_PROFILE
- (Git) Bash
- AWS Copilot CLI installed
- AWS Route53 domain (required for HTTPS, using xpqf.net below)

## Live build and deploy

First time creation of infrastructure

```bash
copilot app init greeter --domain xpqf.net
copilot svc init --name app
copilot svc init --name api
copilot storage init --name db --storage-type Aurora --workload api --engine PostgreSQL --initial-db postgres
copilot env init --name live --default-config --profile $AWS_PROFILE
```

Deploy latest code:

```bash
copilot svc deploy --name api --env live
copilot svc deploy --name app --env live
```

- TODO: Migrate db (from a separate workload, pipeline)

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
