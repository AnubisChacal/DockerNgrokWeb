# 🐳🌐🔗DockerNgrokWeb🐳🌐🔗
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Este projeto utiliza Docker para criar um ambiente que executa um servidor Nginx exposto na internet através do Ngrok. Isso é ideal para desenvolvimento e teste de aplicações web em um ambiente local que precisa ser acessível externamente.

## 🛠️Requisitos🖥️
- Docker
- curl
- jq
- Nginx
- Ngrok


  
## Estrutura do Projeto📁

- /
- |- /scripts 🧰
- |- Dockerfile 📄
- |- ngrok.conf 🛠️
- |- start.sh 🚀
- |- /Meu-Site 🌐
  - |- index.html 📄 (opcional)
  - |- style.css 🎨 (opcional)
  - |- imagem-de-fundo.jpg 🖼️ (opcional)



## Configuração 🛠️

1. **Dockerfile** 📄: Configura o ambiente Ubuntu, instala Nginx e Ngrok, e prepara o servidor para servir o conteúdo estático da pasta /Meu-Site.
    - 🐳 Instala o Ubuntu como base para o ambiente de hospedagem.
    - 🌍 Configura o servidor Nginx para distribuir os arquivos HTML, CSS e imagens.
    - 🚀 Instala e configura o Ngrok para expor seu servidor local à Internet.
      
2. **ngrok.conf** 📋: Arquivo de configuração para o Nginx, que define como os arquivos estáticos são servidos.
    - 🌐 Configura o Nginx para responder a solicitações HTTP para seu site.
    - ⚙️ Define diretórios raiz e comportamentos específicos, como redirecionamento e tratamento de erros.
      
3. start.sh 🚀: Script que inicia o Nginx e o Ngrok, e exibe o URL do Ngrok no console para acesso remoto.
    - 🔗 Inicia o servidor Nginx para começar a servir seu site.
    - 🌍 Ativa o Ngrok e cria um túnel seguro do seu servidor local para a web.
    - 📡 Exibe o URL público do Ngrok para acesso fácil ao seu site de qualquer lugar.
