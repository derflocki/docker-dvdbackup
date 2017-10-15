FROM ubuntu:16.04
MAINTAINER Marvin Winkler <marvambass@gmail.com>

ENV LANG C.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	lsdvd \
	dvdbackup \
	genisoimage \
	libdvd-pkg \
	&& rm -rf /var/lib/apt/lists/* \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure libdvd-pkg

VOLUME /rips

ADD dvd2iso.sh /usr/local/bin/dvd2iso.sh

RUN chmod a+x /usr/local/bin/dvd2iso.sh

CMD /usr/local/bin/dvd2iso.sh
