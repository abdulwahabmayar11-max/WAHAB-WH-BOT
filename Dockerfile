# Customized for WAHAB MD V6 WH-BOT
FROM node:lts-bullseye

# Developer Info
LABEL maintainer="Wahab <https://github.com>"
LABEL description="Custom WhatsApp Bot - WAHAB MD V6"

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
