FROM mariadb:10.6.16-focal

ARG sql_repo_file_path="./app-config/database/devopstravel.sql"

WORKDIR "/home"

COPY "${sql_repo_file_path}" "/docker-entrypoint-initdb.d/"
