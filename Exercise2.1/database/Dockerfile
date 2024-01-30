FROM postgres:15-alpine

ARG artifacts_path="./bootcamp-devops-2023/295words-docker/db"

WORKDIR "/home"

COPY "${artifacts_path}/." "/docker-entrypoint-initdb.d/"

EXPOSE 5432/tcp
