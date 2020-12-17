ARG SKIPFISH_VERSION=2.10b
#
# BUILD CONTAINER
#
FROM alpine:latest as BUILDER

# 2.10b released 2012. This is latest as of 2020 Dec 17.
ARG SKIPFISH_VERSION
ENV SKIPFISH_VERSION_TO_DOWNLOAD ${SKIPFISH_VERSION}
ENV SKIPFISH_BASE_URL "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/skipfish/skipfish-"
ENV SKIPFISH_DOWNLOAD_URL "$SKIPFISH_BASE_URL$SKIPFISH_VERSION.tgz"
ENV SKIPFISH_SRC_FILENAME "skipfish-$SKIPFISH_VERSION.tgz"

# Setup system level dependencies
# WARNING: Using openssl-dev will cause the compilation to fail. Libressl-dev has the correct ssl
# call to avoid the compilation error.
# Sample compilation error when using openssl-dev:
#	src/http_client.c:1965:10: error: dereferencing pointer to incomplete type 'SSL_CIPHER' {aka 'const struct ssl_cipher_st'}
#	1965 |   if(!(cp->algo_strength & SSL_MEDIUM) && !(cp->algo_strength & SSL_HIGH))

RUN apk --update add libc-dev make gcc libressl-dev pcre-dev libidn-dev zlib-dev

# Download the tool source and unpack
RUN mkdir -p /opt/skipfish && \
	cd /opt/skipfish && \
	wget $SKIPFISH_DOWNLOAD_URL && \
	tar vxzf ./$SKIPFISH_SRC_FILENAME && \
	cd "skipfish-$SKIPFISH_VERSION_TO_DOWNLOAD" && \
	make 

#
# RUNTIME CONTAINER
#
FROM alpine:latest
ARG SKIPFISH_VERSION
ENV SKIPFISH_VERSION_TO_DOWNLOAD $SKIPFISH_VERSION
# Setup system environment
RUN apk --update add libressl pcre libidn
RUN mkdir -p /opt/skipfish

# DON'T RUN AS ROOT
RUN adduser -D skipfish_user

# Volume to store output in users environment not the ephemeral container
VOLUME /output

# Executable
COPY --from=BUILDER /opt/skipfish/skipfish-$SKIPFISH_VERSION_TO_DOWNLOAD /opt/skipfish/skipfish-$SKIPFISH_VERSION_TO_DOWNLOAD

# Make directories usable by our non-root user
RUN chown -R skipfish_user /output /opt/skipfish/skipfish-$SKIPFISH_VERSION_TO_DOWNLOAD

USER skipfish_user
WORKDIR /opt/skipfish/skipfish-2.10b
ENTRYPOINT ["/opt/skipfish/skipfish-2.10b/skipfish"]
CMD ["-H"]

