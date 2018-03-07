# mpdmail-webapps-docker

## Structure
ngninxproxy/
this is the proxy for all web services

huginn/

tbd.

## (Re-)Deployment
1. run ```bash docker network create nginx-proxy```
every container using the nginx proxy has to be in this network
1. (optional) restore all necessary volumes from backup
2. copy relevant credentials_<app>.env files from secure location or create new from credentials_<app>.env_template
3. create DNS A records for all required subdomains for this host and add the subdomains in the docker-compose.yml
4. run ```bash
sudo docker compose up -d```
for every app you want to run

## Add new webapp reachable under subdomain newwebapp.mpdmail.de

This assumes that the domain is mpdmail.de

1. Create a new DNS A record mapping newwebapp.mpdmail.de to the IP of the host
2. Add the webapp container to the docker-compose.yml
2.1. Simple example entry:
```yaml
  newwebapp:  
    image: pathto/webappimage
    restart: always
    environment:
      - VIRTUAL_HOST=newwebapp.mpdmail.de
      - LETSENCRYPT_HOST=newwebapp.mpdmail.de
      - LETSENCRYPT_EMAIL=github@mpdmail.de
    expose:
      - <PORT>
    networks:
      - proxy-tier
```
