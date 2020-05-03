FROM openjdk:8-slim
VOLUME /tmp
EXPOSE 8761
COPY ./target/springboot-servicio-eureka-server-0.0.1-SNAPSHOT.jar eureka-server.jar
COPY ./wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh
ENTRYPOINT ./wait-for-it.sh -t 0 config-server:8888 -- java -jar -Dspring.profiles.active=docker eureka-server.jar
