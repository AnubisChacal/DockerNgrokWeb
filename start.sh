#!/bin/bash

# Adicionar o authtoken do Ngrok
ngrok authtoken 2H9mmTbZR2kfK8brcVbTvlzw4qm_42cy7zFS5pKoLKpczZ4vK

# Iniciar Nginx
service nginx start

# Iniciar Ngrok em segundo plano e redirecionar o tráfego da porta 80
ngrok http 80 &

# Aguardar um momento para o Ngrok conectar
sleep 10

# Capturar o URL do Ngrok
NGROK_URL=$(curl --silent http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[] | select(.proto=="https") | .public_url')

echo "Site disponível em: $NGROK_URL"

# Mantém o script em execução
while true; do sleep 30; done;