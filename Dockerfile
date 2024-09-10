FROM node:16.14.2 as production

WORKDIR /usr/src/app

COPY package*.json .


RUN npm i -g @nestjs/cli typescript ts-node
RUN npm install

COPY . .

RUN npm run build

CMD ["/bin/bash", "./startup.dev.sh"]