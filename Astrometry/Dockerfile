FROM alpine

ARG ASTROMETRY_URL='https://github.com/dstndstn/astrometry.net/releases/download/0.97/astrometry.net-0.97.tar.gz'
ARG EXTRA_PACKAGES=""
ARG BUILD_JOBS="4"
ARG BUILD_PACKAGES="py3-pip build-base python3-dev make pkgconf gcc bsd-compat-headers lzlib-dev zlib-dev bzip2-dev cfitsio-dev libjpeg-turbo-dev cairo-dev py3-numpy-dev netpbm-dev libpng-dev"
ARG BASE_PACKAGES="python3 bash lzlib zlib bzip2 cfitsio libjpeg-turbo cairo py3-numpy netpbm libpng"

# get our base stuff out the way
RUN set -x \
    && mkdir -p /opt/build \
    && apk update \
    && apk add $BUILD_PACKAGES $BASE_PACKAGES $EXTRA_PACKAGES 

# Lets do the actual build
RUN wget -O /opt/build/build.tar.gz $ASTROMETRY_URL \
    && mkdir /opt/build/astrometry \
    && tar xfz /opt/build/build.tar.gz -C /opt/build/astrometry \
    && cd /opt/build/astrometry/astro* \
    && make -j $BUILD_JOBS || /bin/true \
    && make -j $BUILD_JOBS install || /bin/true


# lets clean some stuff
RUN apk del $BUILD_PACKAGES
RUN apk cache clean
RUN apk cache purge
RUN rm -rf /opt/build

# 
# VOLUME [ ]

ADD ./entrypoint.sh /

# why doesnt bash in alpine already have this (probably dont need it from the astrometry build)?
RUN cp /bin/bash /bin/rbash

CMD ["/entrypoint.sh"]
