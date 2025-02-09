FROM ubuntu:24.04

ARG EXTRA_PACKAGES=""
ARG BUILD_JOBS="4"
ARG BUILD_PACKAGES=""
ARG BASE_PACKAGES="astrometry.net astrometry-data-tycho2"

# get our base stuff out the way
RUN set -x \
    && apt update \
    && apt install -y $BUILD_PACKAGES $BASE_PACKAGES $EXTRA_PACKAGES 

# lets clean some stuff
#RUN apt purge -y $BUILD_PACKAGES

# 
# VOLUME [ ]

ADD ./entrypoint.sh /

CMD ["/entrypoint.sh"]
