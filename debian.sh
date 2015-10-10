#!/usr/bin/env bash

sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors.sohu.com\/ubuntu\//' /etc/apt/sources.list && \
sed -i 's/deb-src/# deb-src/' /etc/apt/sources.list && \
mkdir /tmp/fixup && cd /tmp/fixup && \
curl -fSL -o master.tar.gz "https://github.com/lifei/docker-fixup/archive/master.tar.gz" && \
tar zxf master.tar.gz && \
mv docker-fixup-master/scripts /bd_build && \
/bd_build/prepare-debian.sh
/bd_build/system_services.sh && \
/bd_build/utilities.sh && \
/bd_build/cleanup.sh && \
rm -rf /tmp/fixup
