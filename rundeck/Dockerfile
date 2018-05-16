FROM openjdk:8u171-jdk-stretch

ADD http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-2.11.3.jar /opt/rundeck/

RUN groupadd rundeck \
&& useradd  -d /var/lib/rundeck -m -s  /bin/bash rundeck -g rundeck \
&& chmod a+r /opt/rundeck/rundeck-launcher-2.11.3.jar

USER rundeck

EXPOSE 4440
WORKDIR /var/lib/rundeck

CMD ["java",  "-jar", "/opt/rundeck-launcher-2.11.3.jar", "-b", "/var/lib/rundeck/"]
