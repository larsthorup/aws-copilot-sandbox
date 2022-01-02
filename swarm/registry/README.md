# docker registry

Try it out:

```bash
docker pull postgres:14.1
docker tag postgres:14.1 registry.docker.localhost/postgres:14.1
docker push registry.docker.localhost/postgres:14.1
docker pull registry.docker.localhost/postgres:14.1
curl --insecure https://registry.docker.localhost/v2/_catalog
curl --insecure https://registry.docker.localhost/v2/postgres/tags/list
```

## Notes

- `registry.docker.localhost` needs to be in local hosts file
