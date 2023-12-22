FROM amazoncorretto:21-al2023

ARG artifacts_path="./bootcamp-devops-2023/295words-docker/api/target"
ARG maven_path="/usr/src/mymaven"

WORKDIR "${maven_path}"

COPY "${artifacts_path}/." "${maven_path}"

EXPOSE 8080/tcp

ENTRYPOINT ["java", "-jar","words.jar"]
