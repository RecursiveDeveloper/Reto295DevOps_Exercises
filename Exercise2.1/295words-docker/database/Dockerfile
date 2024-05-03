FROM postgres:15-alpine

ARG artifacts_path="./app-config/db"

WORKDIR "/home"

COPY "${artifacts_path}/." "/docker-entrypoint-initdb.d/"

EXPOSE 5432/tcp
