# Docker file for presentation and memory/malware forensics
# docker pull followthewhiterabbit/dfir (This dockerfile prebuilt)

FROM ubuntu:latest
MAINTAINER Ziran "@grotezinfosec"

RUN apt-get update -y
RUN apt-get install -qqy x11-apps
RUN apt-get install -y wget libemail-outlook-message-perl libemail-sender-perl evolution evolution-plugins exiftool lynx
RUN wget https://github.com/sans-dfir/sift-cli/releases/download/v1.5.1/sift-cli-linux && mv sift-cli-linux /usr/local/bin/sift
RUN chmod 755 /usr/local/bin/sift
RUN useradd sift
RUN apt-get install sudo
RUN sudo sift install --user sift

ENTRYPOINT clear && echo "welcome" && /bin/bash
