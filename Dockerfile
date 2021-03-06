FROM openjdk:8-slim
VOLUME /tmp
EXPOSE 8761
COPY ./target/springboot-servicio-eureka-server-0.0.1-SNAPSHOT.jar eureka-server.jar
COPY ./wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
RUN sed -i -e 's/\r$//' *.sh
ENTRYPOINT ./entrypoint.sh
