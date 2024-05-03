FROM maven:3.9.6-eclipse-temurin-21-alpine AS maven

ARG artifacts_path="./app-config/api"
ARG maven_path="/usr/src/app"

WORKDIR "${maven_path}"

COPY "${artifacts_path}/." "${maven_path}"

RUN mvn clean install

FROM amazoncorretto:21.0.1-alpine3.18

ARG previous_workdir="/usr/src/app"

WORKDIR /opt/app

COPY --from=maven "${previous_workdir}/target/." /opt/app/

EXPOSE 8080/tcp

ENTRYPOINT ["java","-jar","words.jar"]
