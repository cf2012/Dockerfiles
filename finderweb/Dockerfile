FROM tomcat:8.5.28-jre8-alpine
MAINTAINER  github.com/cf2012

# 下载代码
ADD http://www.finderweb.net/download/finder-web-2.3.3.war /usr/local/tomcat/webapps

# 部署到 tomcat 的 webapp/ROOT 目录下
RUN set -ex; \
    cd /usr/local/tomcat/webapps \
    && rm -rf manager host-manager examples docs ROOT/* \
    && mv finder-web-2.3.3.war finder-web-2.3.3.zip \
    && unzip -o -d ROOT  finder-web-2.3.3.zip \
    && rm  finder-web-2.3.3.zip

