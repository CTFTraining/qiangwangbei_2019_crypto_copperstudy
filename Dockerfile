FROM python:2-slim-stretch

LABEL Organization="CTFTraining" Author="blus <851579181@qq.com>"
MAINTAINER blus@CTFTraining <851579181@qq.com>

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i '/security/d' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install socat -y

COPY copperstudy2.py /app/copperstudy2.py

EXPOSE 10000

ENTRYPOINT socat TCP4-LISTEN:10000,tcpwrap=script,reuseaddr,fork EXEC:"/usr/bin/env python2 -u /app/copperstudy2.py"
