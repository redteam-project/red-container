FROM alpine:latest

RUN apk update && \
    apk add bash

RUN apk add tshark

ENTRYPOINT ["/usr/bin/tshark"]
