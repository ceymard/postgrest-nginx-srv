FROM debian:jessie
MAINTAINER Christophe Eymard <christophe.eymard@sales-way.com>

EXPOSE 80

ADD root /
RUN /bin/bash /config.sh && rm -f /config.sh 

WORKDIR /app
ENV PATH="/app/node_modules/.bin:${PATH}"

ENV PGRST_DB_URI= \
    PGRST_DB_SCHEMA=public \
    PGRST_DB_ANON_ROLE=@unauthenticated \
    PGRST_DB_POOL=100 \
    PGRST_SERVER_HOST=*4 \
    PGRST_SERVER_PORT=3000 \
    PGRST_SERVER_PROXY_URI= \
    PGRST_JWT_SECRET= \
    PGRST_SECRET_IS_BASE64=false \
    PGRST_JWT_AUD= \
    PGRST_MAX_ROWS= \
    PGRST_PRE_REQUEST= \
    PGRST_ROLE_CLAIM_KEY=".role"


ENTRYPOINT ["/init"]
CMD []

