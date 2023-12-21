FROM maven:3.9.6-amazoncorretto-21-al2023

ARG artifacts_path="./bootcamp-devops-2023/295words-docker/api/target"

WORKDIR "/home"

COPY "${artifacts_path}/." "/usr/src/mymaven"

EXPOSE 8080/tcp

ENTRYPOINT ["java", "-jar","words.jar"]
