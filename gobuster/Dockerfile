FROM golang:alpine AS builder
LABEL maintainer="RTP @redteamproject"

WORKDIR /go/src/gobuster
RUN apk add --update ca-certificates 
RUN apk add --no-cache git && \
    git clone https://github.com/OJ/gobuster.git . && \
    git clone https://github.com/daviddias/node-dirbuster.git /node-dirbuster && \
    go get && \
    set -ex && \
    cd /go/src/gobuster && \
    CGO_ENABLED=0 go build

FROM golang:alpine
LABEL maintainer="RTP @redteamproject"

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/src/gobuster /
COPY --from=builder /node-dirbuster/lists/* /

ENTRYPOINT [ "/gobuster" ]
CMD [ "--help" ]
