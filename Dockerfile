FROM python:2.7

ENV DEBIAN_FRONTEND noninteractive

RUN \ 
    apt-get update && \
    apt-get install -y python-m2crypto

RUN pip install shadowsocks gevent

COPY run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 3108

CMD ["/run.sh"]

