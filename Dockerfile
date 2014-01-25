# ngIRCd
# Version 0.1

FROM yrpri/base
MAINTAINER Robert Vidar Bjarnason <robert@citizens.is>

RUN echo 'version 0.3'

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install ngircd

ADD ngircd.conf /etc/ngircd/ngircd.conf
ADD ngircd.motd /etc/ngircd/ngircd.motd

ADD supervisor.conf /etc/supervisor/conf.d/ngircd.conf

EXPOSE 6667

CMD ["/usr/bin/supervisord"]
