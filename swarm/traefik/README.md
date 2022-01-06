# traefik

- We merge environment config and generic config to support both of these scenarios:
  - Cannot use mkcert certificate on public swarm (mkcert CA is not trusted for non local IPs)
  - Cannot use Let's Encrypt on local swarm (cannot validate DNS)
- Cannot use YAML anchors in traefik dynamic config
  - so to inject different tls config for local and ec2 we put that config in docker-compose which DO support anchors
- Inject email for Let's Encrypt into static config via envsubst
