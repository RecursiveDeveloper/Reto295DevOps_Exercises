FROM mariadb:10.6.16-focal

ARG sql_repo_file_path="./bootcamp-devops-2023/app-295devops-travel/database/devopstravel.sql"

WORKDIR "/home"

COPY "${sql_repo_file_path}" "/docker-entrypoint-initdb.d/"
