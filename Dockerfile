# Usar a imagem base do Ubuntu
FROM ubuntu:latest

# Instalar nginx e ferramentas necessárias
RUN apt-get update && apt-get install -y nginx curl jq gnupg

# Configurar o repositório do Ngrok e instalar o Ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list \
    && apt-get update \
    && apt-get install -y ngrok

# Copiar a pasta Meu-Site para o diretório do Nginx
COPY /Meu-Site /var/www/html

# Copiar a configuração do Nginx para sites-available
COPY /ngrok.conf /etc/nginx/sites-available/default

# Garantir que o diretório sites-enabled esteja limpo e criar um link simbólico
RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Conceder permissões de execução para o script de inicialização
COPY /start.sh /start.sh
RUN chmod +x /start.sh

# Expor as portas necessárias
EXPOSE 80

# Comando para iniciar o container
CMD ["/start.sh"]
