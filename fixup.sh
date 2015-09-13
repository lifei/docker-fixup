#!/usr/bin/env bash

sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors.sohu.com\/ubuntu\//' /etc/apt/sources.list && \
sed -i 's/deb-src/# deb-src/' /etc/apt/sources.list && \
apt-get update && apt-get install -y curl unzip && \
mkdir /tmp/fixup && cd /tmp/fixup && \
curl -fSL -o baseimage-docker.zip "https://github.com/phusion/baseimage-docker/archive/master.zip" && \
unzip baseimage-docker.zip && \
mv baseimage-docker-master/image /bd_build && \
/bd_build/prepare.sh && \
/bd_build/system_services.sh && \
/bd_build/utilities.sh && \
/bd_build/cleanup.sh
rm -rf /tmp/fixup
