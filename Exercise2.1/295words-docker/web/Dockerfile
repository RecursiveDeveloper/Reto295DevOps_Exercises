FROM golang:alpine

ARG go_files_path="./app-config/web"

WORKDIR /app

COPY "${go_files_path}/." "./"

RUN go mod init "web" && \
    go mod download

RUN go build -o "./go-devops"

EXPOSE 80/tcp

CMD [ "./go-devops" ]
