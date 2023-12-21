FROM golang:alpine3.19

ARG go_files_path="./bootcamp-devops-2023/295words-docker/web"
ARG build_config_path=""

WORKDIR /app

COPY "${go_files_path}/." "./"

RUN go mod init "web" && \
    go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o "/go-devops"

EXPOSE 5000

CMD [ "/go-devops" ]
