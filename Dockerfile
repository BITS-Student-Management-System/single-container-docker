FROM openjdk:8


RUN apt-get -y update && apt-get -y install supervisor
RUN mkdir -p /etc/supervisor/conf.d
ADD single-container-docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./service-registry/target/service-registry-0.0.1-SNAPSHOT.jar service-registry-0.0.1-SNAPSHOT.jar
ADD ./cloud-config-server/target/cloud-config-server-0.0.1-SNAPSHOT.jar cloud-config-server-0.0.1-SNAPSHOT.jar
ADD ./course-service/target/course-service-0.0.1-SNAPSHOT.jar course-service-0.0.1-SNAPSHOT.jar
ADD ./cloud-gateway/target/cloud-gateway-0.0.1-SNAPSHOT.jar cloud-gateway-0.0.1-SNAPSHOT.jar

EXPOSE 8761
EXPOSE 9296
EXPOSE 9003
EXPOSE 9191
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

