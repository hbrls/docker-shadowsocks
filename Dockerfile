FROM python:3

ENV DEBIAN_FRONTEND noninteractive

RUN \ 
    apt-get update && \
    apt-get install -y python-m2crypto supervisor

RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

RUN  rm -rf /var/lib/apt/lists/*

RUN pip install shadowsocks gevent

COPY shadowsocks.conf /etc/supervisor/conf.d/

COPY run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 3108

CMD ["/run.sh"]

