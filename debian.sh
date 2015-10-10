#!/usr/bin/env bash

sed -i 's/httpredir.debian.org/mirrors.163.com/' /etc/apt/sources.list
sed -i 's/deb-src/# deb-src/' /etc/apt/sources.list
mkdir -p /tmp/fixup && \
curl -fSL -o /tmp/fixup/master.tar.gz "https://github.com/lifei/docker-fixup/archive/master.tar.gz" && \
tar zxf /tmp/fixup/master.tar.gz -C /tmp/fixup && \
mv /tmp/fixup/docker-fixup-master/scripts /bd_build && \
find /bd_build -name '*.sh' | xargs chmod a+x && \
/bd_build/prepare-debian.sh
/bd_build/system_services.sh && \
/bd_build/utilities.sh && \
/bd_build/cleanup.sh && \
rm -rf /tmp/fixup
