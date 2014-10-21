FROM ubuntu:14.04
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

RUN apt-get -q update &&\
    apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl

RUN curl -L  -O https://github.com/midgetspy/Sick-Beard/tarball/master &&\
 tar -xvf sickbeard.tgz -C /  &&\
 mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
 rm  /sickbeard.tgz

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
