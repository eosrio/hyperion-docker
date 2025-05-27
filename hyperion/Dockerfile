FROM node:22
RUN apt-get update
RUN npm install pm2 -g
RUN apt-get install git -y
RUN git clone --branch release/3.6 --single-branch https://github.com/eosrio/hyperion-history-api.git
WORKDIR /hyperion-history-api
#RUN git checkout releases/3.6
RUN npm install
CMD ["tail", "-f", "/dev/null"]
