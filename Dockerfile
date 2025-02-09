FROM alpine

ARG ASTROMETRY_URL='https://github.com/dstndstn/astrometry.net/releases/download/0.97/astrometry.net-0.97.tar.gz'
ARG EXTRA_PACKAGES=""
ARG BUILD_JOBS="4"
ARG BASE_PACKAGES="py3-pip build-base python3-dev bash make pkgconf gcc bsd-compat-headers lzlib-dev zlib-dev bzip2-dev cfitsio-dev libjpeg-turbo-dev cairo-dev py3-numpy-dev py3-numpy netpbm-dev libpng-dev netpbm libpng libjpeg-turbo"

RUN set -x \
    && mkdir -p /opt/build \
    && apk update \
    && apk add $BASE_PACKAGES $EXTRA_PACKAGES 

    # && apk del build-base linux-headers python3-dev acl-dev lz4-dev xxhash-dev


    # && apt-get remove -y --purge build-essential libssl-dev liblz4-dev libacl1-dev \
    # && apt-get autoremove -y --purge \
    # && mkdir /var/run/sshd \
    # && mkdir /var/backups/borg \
    # && rm -rf /var/lib/apt/lists/*

# Lets do the actual build
RUN wget -O /opt/build/build.tar.gz $ASTROMETRY_URL \
    && mkdir /opt/build/astrometry \
    && tar xfz /opt/build/build.tar.gz -C /opt/build/astrometry \
    && cd /opt/build/astrometry/astro* \
    && make -j $BUILD_JOBS || /bin/true \
    && make -j $BUILD_JOBS install || /bin/true


# 
# VOLUME [ ]

ADD ./entrypoint.sh /

# why doesnt bash in alpine already have this (probably dont need it from the astrometry build)?
RUN cp /bin/bash /bin/rbash
