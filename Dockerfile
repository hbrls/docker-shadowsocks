FROM python:3-alpine


ADD shadowsocks.conf /shadowsocks.conf
ADD run.sh /run.sh

RUN \ 
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update bash py-m2crypto@testing py-gevent@testing supervisor && rm -rf /var/cache/apk/* && \
    sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisord.conf && \
    mkdir -p /var/log/supervisor/ && \
    pip install shadowsocks && \
    cat /shadowsocks.conf >> /etc/supervisord.conf && \
    chmod 755 /run.sh

EXPOSE 3108

CMD ["/run.sh"]

