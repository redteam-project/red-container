FROM alpine:latest

RUN apk update && \
    apk add bash

RUN apk add nmap && \
    apk add nmap-scripts


ENTRYPOINT [ "/usr/bin/nmap" ]