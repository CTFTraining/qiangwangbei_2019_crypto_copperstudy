FROM ubuntu:16.04

ADD sources.list /etc/apt/

RUN apt update -y
RUN apt-get install -y socat python
COPY copperstudy2.py ./
RUN chmod 777 copperstudy2.py
EXPOSE 37777
ENTRYPOINT socat TCP4-LISTEN:37777,tcpwrap=script,reuseaddr,fork EXEC:"/usr/bin/env python2 -u copperstudy2.py"&& /bin/bash
