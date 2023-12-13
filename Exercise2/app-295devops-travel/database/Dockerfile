FROM mariadb:latest

ARG sql_files_path="sql_scripts"

WORKDIR "/home"

COPY "${sql_files_path}/01-provision.sql" "/docker-entrypoint-initdb.d/"
COPY "${sql_files_path}/02-populate-db.sql" "/docker-entrypoint-initdb.d/"
