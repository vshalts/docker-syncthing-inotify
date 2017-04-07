FROM vshalts/alpine:alpine-3.4

MAINTAINER Vadim Shalts <vshalts@gmail.com>

ENV VERSION 0.8.5
ENV RELEASE syncthing-inotify-linux-amd64-v${VERSION}
ENV PACKAGE ${RELEASE}.tar.gz
ENV URL https://github.com/syncthing/syncthing-inotify/releases/download/v${VERSION}/$PACKAGE

RUN curl -L "$URL" | tar xzf - && \
    mv syncthing-inotify /usr/local/bin/syncthing-inotify && \
    chmod a+x /usr/local/bin/syncthing-inotify && \
    rm -rf ${RELEASE} && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

RUN mkdir -p /app/.config/syncthing
RUN mkdir -p /app/Sync

USER nobody

ENV HOME /app

CMD ["/usr/local/bin/syncthing-inotify"]
