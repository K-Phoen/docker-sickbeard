FROM resin/rpi-raspbian
MAINTAINER Kévin Gomez <contact@kevingomez.fr>

ENV DEBIAN_FRONTEND noninteractive
ENV SICKBEARD_VERSION master
#ENV SICKBEARD_VERSION build-506

RUN apt-get -q update && apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl

RUN curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
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
