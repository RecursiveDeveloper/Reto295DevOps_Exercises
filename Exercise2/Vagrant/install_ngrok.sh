#!/bin/bash

authtoken="2WuFTtObR3Q4WhNEKEbzgZWoLAa_5D1v8CvBm44CNVmQFivzn"
port="8080"

curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok

echo -e "\n***********************"
echo "Configurando ngrok"
echo -e "***********************\n"
ngrok config add-authtoken $authtoken
ngrok http http://localhost:$port
