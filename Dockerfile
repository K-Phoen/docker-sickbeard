FROM ubuntu:precise
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah

ADD https://github.com/midgetspy/Sick-Beard/tarball/master /
RUN tar -xvf master -C /  && mv /midgetspy-Sick-Beard-* /sickbeard/ 

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

ENTRYPOINT ["/start.sh"]
