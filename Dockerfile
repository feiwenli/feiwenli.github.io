FROM registry.saas.hand-china.com/tools/nginx:latest

MAINTAINER Feiwen

# copy 
COPY public /usr/work/
COPY build.sh /usr/work/
COPY run.sh /usr/work/

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates asciidoc    && rm -rf /var/lib/apt/lists/*

# Download and install hugo
ENV HUGO_VERSION 0.44
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD hugo_0.44_Linux-64bit.deb /tmp/hugo.deb

RUN dpkg -i /tmp/hugo.deb  && rm /tmp/hugo.deb

ENV HUGO_BASE_URL "http://localhost:1313"

RUN echo "success~"
