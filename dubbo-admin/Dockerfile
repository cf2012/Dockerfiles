FROM tomcat:8.5.28-jre8-alpine
MAINTAINER  github.com/cf2012

# 将代码复制到容器. ROOT.tgz 是dubbo-admin编译后的文件所在的目录
COPY ROOT.tgz /usr/local/tomcat/webapps/

# 部署到 tomcat 的 webapp/ROOT 目录下
RUN set -ex; \
    cd /usr/local/tomcat/webapps \
    && rm -rf manager host-manager examples docs ROOT/* \
    && tar xf ROOT.tgz \
    && rm  ROOT.tgz
