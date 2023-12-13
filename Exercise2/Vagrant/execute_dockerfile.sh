#!/bin/bash

resource_name="apache"

cd /home/app-295devops-travel
bash start_services.sh

echo "Waiting for server to start..."
sleep 10
curl -I localhost:8080
