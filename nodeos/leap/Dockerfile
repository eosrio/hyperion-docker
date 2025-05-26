FROM ubuntu:24.04

RUN apt-get update
RUN apt-get upgrade
RUN apt-get autoremove
RUN apt install zstd

RUN apt-get update && apt-get install -y wget


WORKDIR /nodeos

# RUN wget -nv https://github.com/AntelopeIO/spring/releases/download/v1.0.1/antelope-spring_1.0.1_amd64.deb
# RUN apt-get install -y ./antelope-spring_1.0.1_amd64.deb
RUN wget https://github.com/AntelopeIO/leap/releases/download/v5.0.2/leap_5.0.2_amd64.deb
RUN apt install ./leap_5.0.2_amd64.deb -y
RUN rm ./leap_5.0.2_amd64.deb

EXPOSE 8080
