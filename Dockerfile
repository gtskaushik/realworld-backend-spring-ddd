FROM openjdk:11

MAINTAINER Kaushik, Gunasekaran(gtskaushik@gmail.com)

# Copy config
ADD src/main/resources/application.properties /opt/app/application.properties

# Copy binary
ADD target/backend-0.0.1-SNAPSHOT.jar /opt/app/backend.jar

ENV JAVA_OPTS="-XX:+PrintFlagsFinal -XX:MinRAMPercentage=100 -XX:MaxRAMPercentage=90 -XshowSettings:all"

ENTRYPOINT exec java -Dspring.config.location=/opt/app/application.properties \
        $JAVA_OPTS -jar /opt/app/backend.jar