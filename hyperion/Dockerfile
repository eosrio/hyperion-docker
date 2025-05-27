FROM node:24-slim
RUN apt-get update
RUN npm install pm2 -g
RUN apt-get install git
RUN git clone --branch releases/3.6 --single-branch https://github.com/eosrio/hyperion-history-api.git
WORKDIR /hyperion-history-api
#RUN git checkout releases/3.6
RUN npm install
