FROM node:20
RUN npm install pm2 -g
RUN git clone --branch 3.3.10-strict --single-branch https://github.com/eosrio/hyperion-history-api.git
WORKDIR /hyperion-history-api
RUN git checkout main
RUN npm install
