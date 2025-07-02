FROM ubuntu:24.04

RUN apt-get update
RUN apt-get upgrade
RUN apt-get autoremove
RUN apt install zstd

RUN apt-get update && apt-get install -y wget


WORKDIR /nodeos

RUN wget -nv https://github.com/AntelopeIO/spring/releases/download/v1.2.0/antelope-spring_1.2.0_amd64.deb
RUN apt-get install -y ./antelope-spring_1.2.0_amd64.deb
RUN rm ./antelope-spring_1.2.0_amd64.deb

EXPOSE 8080
