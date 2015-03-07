FROM ubuntu:14.04
MAINTAINER Michael Tuttle <openam@gmail.com>

# To get rid of error messages like "debconf: unable to initialize frontend: Dialog":
ENV DEBIAN_FRONTEND noninteractive

# Include our startup script
ADD ./start.sh /start.sh

# Install sabnzbd and utilites
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list && \
  apt-get -q update && \
  apt-get install -qy \
    python-software-properties \
    software-properties-common && \
  add-apt-repository -y ppa:jcfp/ppa && \
  apt-get -q update && \
  apt-get install -qy --force-yes \
    sabnzbdplus \
    sabnzbdplus-theme-classic \
    sabnzbdplus-theme-mobile \
    sabnzbdplus-theme-plush \
    par2 \
    python-yenc \
    unzip \
    unrar && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  chmod u+x /start.sh

VOLUME /config
VOLUME /data

EXPOSE 8080 9090

CMD [ "./start.sh" ]
