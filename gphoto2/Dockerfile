FROM alpine:3.21.2

ARG EXTRA_PACKAGES=""
ARG BUILD_JOBS="4"
ARG BUILD_PACKAGES="gcc"
ARG BASE_PACKAGES="gphoto2 bash"

# get our base stuff out the way
RUN set -x \
    && apk update \
    && apk add $BUILD_PACKAGES $BASE_PACKAGES $EXTRA_PACKAGES 

# lets clean some stuff
RUN apk del $BUILD_PACKAGES
RUN apk cache clean
RUN apk cache purge

# 
# VOLUME [ ]

ADD ./entrypoint.sh /

CMD ["/entrypoint.sh"]
