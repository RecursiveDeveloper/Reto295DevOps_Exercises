#!/bin/bash

resource_name="apache"

cd /home/ubuntu/Exercise2
docker build -t $resource_name:1.0 .
docker run -d \
  --name $resource_name \
  -p "8080:80" $resource_name:1.0

echo "Waiting for server to start..."
sleep 10
curl -I localhost:8080
