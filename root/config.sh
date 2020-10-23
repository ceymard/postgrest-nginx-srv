#!/bin/ash

export POSTGREST_VERSION='7.0.1'

cd /
adduser -h /server -u 1000 -s /bin/ash user
mkdir /static
mkdir -p /protected
mkdir -p /saml
chown user /saml

apk add --no-cache libpq psmisc ca-certificates xz

# Install s6-overlay
wget https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.3/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz
tar xfz /tmp/s6-overlay.tar.gz -C /
rm /tmp/s6-overlay.tar.gz

# Install Postgrest
wget https://github.com/PostgREST/postgrest/releases/download/v$POSTGREST_VERSION/postgrest-v$POSTGREST_VERSION-linux-x64-static.tar.xz --no-check-certificate -O /tmp/postgrest.tar.xz
tar -xf /tmp/postgrest.tar.xz -C /tmp 
rm /tmp/postgrest.tar.xz
mv /tmp/postgrest /usr/local/bin/postgrest
