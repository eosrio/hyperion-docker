FROM node:24-alpine
RUN npm install pm2 -g
RUN git clone --branch releases/3.6 --single-branch https://github.com/eosrio/hyperion-history-api.git
WORKDIR /hyperion-history-api
RUN git checkout main
RUN npm install
