FROM ubuntu:14.04
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah
RUN apt-get install -qy --force-yes wget tar ca-certificates curl
#RUN wget --quiet https://github.com/midgetspy/Sick-Beard/tarball/master /
RUN curl -L  -O https://github.com/midgetspy/Sick-Beard/tarball/master &&\
 tar -xvf master -C /  && mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
 rm  /midgetspy-Sick-Beard-*

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
