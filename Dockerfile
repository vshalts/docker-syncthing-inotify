FROM vshalts/alpine:latest

MAINTAINER Vadim Shalts <vshalts@gmail.com>

ENV VERSION 0.6.7
ENV RELEASE syncthing-inotify-linux-amd64-v${VERSION}
ENV PACKAGE ${RELEASE}.tar.gz
ENV URL https://github.com/syncthing/syncthing-inotify/releases/download/v${VERSION}/$PACKAGE

RUN curl -L "$URL" | tar xzf - && \
    mv syncthing-inotify /usr/local/bin/syncthing-inotify && \
    rm -rf ${RELEASE} && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

USER nobody

CMD ["syncthing-inotify"]
