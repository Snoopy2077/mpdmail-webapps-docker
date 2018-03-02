# mpdmail-webapps-docker

This assumes that the domain is mpdmail.de

## Add new webapp reachable under subdomain newwebapp.mpdmail.de
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
