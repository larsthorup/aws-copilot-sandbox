# docker registry

Try it out:

```bash
docker pull postgres:14.1
docker tag postgres:14.1 localhost:5000/postgres:14.1
docker push localhost:5000/postgres:14.1
docker pull localhost:5000/postgres:14.1
curl http://localhost:5000/v2/_catalog
curl http://localhost:5000/v2/postgres/tags/list
```
