#!/bin/bash

export NGINX_SOURCE="nginx-1.17.9"
export YOUR_NGINX_RTMP_MODULE_SOURCE="/usr/share/nginx/html/nginx-rtmp-module-master"

# install packages for nginx
apt-get update && apt-get install -y vim less net-tools procps fish autoconf wget unzip
apt-get install build-essential libpcre3 libpcre3-dev libssl-dev ffmpeg zlib1g-dev

# download nginx source
wget http://nginx.org/download/"${NGINX_SOURCE}.tar.gz"
tar -zxvf "${NGINX_SOURCE}.tar.gz"
rm ${NGINX_SOURCE}.tar.gz

# download nginx-rtmp-module source
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master.zip  
rm -rf master.zip

# git clone https://github.com/arut/nginx-rtmp-module

# install nginx
cd $NGINX_SOURCE
    ./configure --add-module=$YOUR_NGINX_RTMP_MODULE_SOURCE
    make CFLAGS="-Wno-error" && make install
cd -

#rm -rf "${NGINX_SOURCE}"

# config nginx.conf /usr/local/nginx/conf/nginx.conf
cp nginx.conf /etc/nginx/
cp nginx.conf /usr/local/nginx/conf/

# add video tag into /usr/local/nginx/html/hls.html


# start nginx
nginx -t && nginx -s reload
# reload nginx config
# sudo /usr/local/nginx/sbin/nginx –s reload
# stop nging
# sudo /usr/local/nginx/sbin/nginx -s stop
#
