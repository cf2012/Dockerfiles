FROM tomcat:8.5-jre8-alpine
MAINTAINER  cf2012@github

RUN set -ex; mkdir -p /tmp/finder

# 下载代码
ADD http://www.finderweb.net/download/finder-web-2.3.3.war /tmp/finder/

WORKDIR /usr/local/tomcat

# 部署到 tomcat 的 webapp/ROOT 目录下
RUN set -ex; \
	rm -rf /usr/local/tomcat/webapps/* ; \
	mkdir -p /usr/local/tomcat/webapps/ROOT \
 	&& unzip -o /tmp/finder/finder-web-2.3.3.war -d /usr/local/tomcat/webapps/ROOT \
	&& rm /tmp/finder/finder-web-2.3.3.war

VOLUME /usr/local/tomcat/webapps/ROOT
