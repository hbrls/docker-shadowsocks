FROM dockerfile/python:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-m2crypto
RUN pip install shadowsocks
RUN pip install gevent

ADD run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 3108

CMD ["/run.sh"]
