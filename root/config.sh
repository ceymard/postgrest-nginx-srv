#!/bin/ash

#export NODE_VERSION='12.16.3'
export POSTGREST_VERSION='7.0.0'

cd /
useradd -m -d /server -s /bin/bash user
mkdir -p /protected
mkdir /run/nginx

apt-get -q update
apt-get -q install -y --no-install-recommends libpq5 nginx-light wget xz-utils psmisc ca-certificates
apt-get -q clean

# Install s6-overlay
wget https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.3/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz
tar xfz /tmp/s6-overlay.tar.gz -C /
rm /tmp/s6-overlay.tar.gz

# Install node
#wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz --no-check-certificate -O /tmp/node.tar.xz
#tar xf /tmp/node.tar.xz -C /usr --strip 1
#rm /tmp/node.tar.xz

# Install Postgrest
wget https://github.com/PostgREST/postgrest/releases/download/v$POSTGREST_VERSION/postgrest-v$POSTGREST_VERSION-ubuntu.tar.xz --no-check-certificate -O /tmp/postgrest.tar.xz
tar -xf /tmp/postgrest.tar.xz -C /tmp 
rm /tmp/postgrest.tar.xz
mv /tmp/postgrest /usr/local/bin/postgrest


# We want nginx to output to our container output
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
mv nginx.conf /etc/nginx/
# rm /etc/nginx/conf.d/*

