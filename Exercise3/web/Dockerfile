FROM golang:alpine

ARG go_files_path="./bootcamp-devops-2023/295words-docker/web"

WORKDIR /app

COPY "${go_files_path}/." "./"

RUN go mod init "web" && \
    go mod download

RUN go build -o "/go-devops"

EXPOSE 5000

CMD [ "/go-devops" ]
