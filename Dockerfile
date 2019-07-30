FROM ubuntu:bionic
RUN apt-get -y update && apt-get -y install sysstat gnuplot vim
CMD bash
