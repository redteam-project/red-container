#
# BUILD CONTAINER
#
FROM alpine:latest as BUILDER

# 2.10b released 2012. This is latest as of 2020 Dec 17.
ENV SKIPFISH_VERSION_TO_DOWNLOAD 2.10b
ENV SKIPFISH_BASE_URL "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/skipfish/skipfish-"
ENV SKIPFISH_DOWNLOAD_URL "$SKIPFISH_BASE_URL$SKIPFISH_VERSION_TO_DOWNLOAD.tgz"
ENV SKIPFISH_SRC_FILENAME "skipfish-$SKIPFISH_VERSION_TO_DOWNLOAD.tgz"

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
	make && \
	cp ./skipfish ../ 
	
	
#
# RUNTIME CONTAINER
#
FROM alpine:latest

# Setup system environment
RUN apk --update add libressl pcre libidn

# RUNTIME CONTAINER
# Copy built container
COPY --from=BUILDER /opt/skipfish/skipfish /
ENTRYPOINT ["/skipfish"]
CMD ["-h"]

