# Getting Started

### Reference Documentation

For more information please take a look [there](https://dev.to/ulrich/configure-keycloak-by-a-cli-extension-779)

### Try it

#### Build your Keycloak image

```shell
❯ DOCKER_BUILDKIT=1 docker build . -t keycloak-configuration-with-cli:latest
```
#### Run the built image

```shell
❯ docker run --name keycloak-configuration-with-cli -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin keycloak-configuration-with-cli:latest
```

Take a look at logs startup. You should see the following log :

```shell
...
...
Executing cli script: /opt/jboss/startup-scripts/update_assets_cache.cli
...
...
```

#### Test the expected value

```shell
❯ docker exec -ti keycloak-configuration-with-cli cat /opt/jboss/keycloak/standalone/configuration/standalone.xml | grep --color staticMaxAge
                <staticMaxAge>3600</staticMaxAge>
```

If you see the expected value at the runtime, it's ok.