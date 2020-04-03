This is the docker-bootstrap config file for the new "static" https://kitty-catalog.m4ck3ngm.com. My `dockerized-server Workflow` post describes the server setup too.

Note that `baseURL=kitty-catalog.m4ck3ngm.com` is set in the project's `config.toml` file, but probably has no bearing in this depolyment scheme.

Run the following ONE time on the host...

```
NAME=kitty-catalog
HOST="kitty-catalog.m4ck3ngm.com"
IMAGE="m4ck3ngm/kitty-catalog"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}
```

See https://github.com/containous/traefik/issues/2796
