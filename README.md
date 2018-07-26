# docker_bind

## Build command
docker build --rm /opt/docker-build/bind/ -t bind:latest

## Start container as daemon
docker run --name bind -d --restart=always --publish 53:53/tcp --publish 53:53/udp --volume /srv/docker/bind:/data bind:latest

