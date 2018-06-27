制作 finderweb 镜像。 

finderweb(http://www.finderweb.net/) 看日志的小工具

```
version: '2'

services:
  finderweb:
    hostname: finderweb
    # rebuild: docker-compose build` or `docker-compose up --build
    build:
      context: ./finderweb
      dockerfile: Dockerfile
    restart: always
    ports:
      - "8080:8080"
    volumes:
      - finderweb_conf:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/conf:rw
      - /logs/finder:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/conf/logs:rw
      - /logs:/logs:ro
    environment:
      - TZ=Asia/Shanghai
    networks:
      - tools
volumes:
  finderweb_conf:

networks:
  tools:
    driver: bridge
```

使用`traefik`
```
version: '2'

services:
  finderweb:
    hostname: finderweb
    # rebuild: docker-compose build` or `docker-compose up --build
    build:
      context: ./finderweb
      dockerfile: Dockerfile
    restart: always
    labels:
      - "traefik.frontend.rule=Host:finder.dev.xxx"
    extra_hosts:
      - "finder.dev.xxx:192.168.1.10" # traefik 的IP
    volumes:
      - finderweb_conf:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/conf:rw
      - /logs/finder:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/conf/logs:rw
      - /logs:/logs:ro
    environment:
      - TZ=Asia/Shanghai
    networks:
      - tools


  reverse-proxy:
    image: traefik # The official Traefik docker image
    command: --api --docker # Enables the web UI and tells Træfik to listen to docker
    ports:
      - "80:80"     # The HTTP port
      - "8080:8080" # The Web UI (enabled by --api)
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # So that Traefik can listen to the Docker events
    networks:
        - tools

volumes:
  finderweb_conf:

networks:
  tools:
    driver: bridge
```
