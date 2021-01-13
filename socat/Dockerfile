# VERSIONS LAST UPDATED 2021 JAN 13
ARG SOCAT_VERSION="1.7.4.1"
ARG NCURSES_VERSION="6.2"
ARG READLINE_VERSION="8.1"
ARG OPENSSL_VERSION="1.1.1i"

#
#	BUILD CONTAINER
#
FROM ubuntu:latest as BUILDER
# Scope global args into this build container
ARG SOCAT_VERSION
ENV SOCAT_VERSION=$SOCAT_VERSION
ARG NCURSES_VERSION
ENV NCURSES_VERSION=$NCURSES_VERSION
ARG READLINE_VERSION
ENV READLINE_VERSION=$READLINE_VERSION
ARG OPENSSL_VERSION
ENV OPENSSL_VERSION=$OPENSSL_VERSION
# END global arg scope inheritance

ARG SOCAT_SOURCE_URL="http://www.dest-unreach.org/socat/download/socat-${SOCAT_VERSION}.tar.gz"
ARG NCURSES_SOURCE_URL="http://invisible-mirror.net/archives/ncurses/ncurses-${NCURSES_VERSION}.tar.gz"
ARG READLINE_SOURCE_URL="ftp://ftp.cwru.edu/pub/bash/readline-${READLINE_VERSION}.tar.gz"
ARG OPENSSL_SOURCE_URL="https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"

# Prepare build environment
RUN apt update && \
	apt install -y build-essential wget
#
#	BUILD NCURSES
#

RUN echo "Building SOCAT dependency: ncurses..."
# Setup build structure
RUN mkdir -p /opt/ncurses/src

# Pull source
RUN wget --progress=bar $NCURSES_SOURCE_URL -O /opt/ncurses/src/ncurses_src.tar.gz

WORKDIR /opt/ncurses/src
# Unpack, configure and build
RUN tar -zxf ncurses_src.tar.gz && \
	cd "ncurses-${NCURSES_VERSION}" && \
	CC='/usr/bin/gcc -static' CLFAGS='-fPIC' ./configure \
	--disable-shared \
	--enable-static

run echo -e "ncurses built\n\n"


#
#       BUILD READLINE
#

RUN echo "Building SOCAT dependency: readline..."
# Setup build structure
RUN mkdir -p /opt/readline/src

# Pull source
RUN wget --progress=bar $READLINE_SOURCE_URL -O /opt/readline/src/readline_src.tar.gz

WORKDIR /opt/readline/src
# Unpack, configure and build
RUN tar -zxf readline_src.tar.gz && \
        cd "readline-${READLINE_VERSION}" && \
        CC='/usr/bin/gcc -static' ./configure --enable-static --enable-shared=no --with-curses && \
	make -j4

# Note that socat looks for readline in <readline/readline.h>, so we need
# that directory to exist.
RUN ln -s "/opt/readline/src/readline-${READLINE_VERSION}" /opt/readline/src/readline

RUN echo -e "readline built\n\n"


#
#       BUILD OPENSSL
#

RUN echo "Building SOCAT dependency: openssl..."
# Setup build structure
RUN mkdir -p /opt/openssl/src

# Pull source
RUN wget --progress=bar $OPENSSL_SOURCE_URL -O /opt/openssl/src/openssl_src.tar.gz

WORKDIR /opt/openssl/src
# Unpack, configure and build
RUN tar -zxf openssl_src.tar.gz && \
        cd "openssl-${OPENSSL_VERSION}" && \
        CC='/usr/bin/gcc -static' ./config no-shared && \
	make -j4

run echo -e "openssl built\n\n"

#
#	BUILD SOCAT
#

# Setup build structure
RUN mkdir -p /opt/socat/src

# Pull source
RUN wget $SOCAT_SOURCE_URL -O /opt/socat/src/socat_src.tar.gz

WORKDIR /opt/socat/src
#Unpack, configure and build
RUN tar -zxf socat_src.tar.gz && \
	cd "socat-${SOCAT_VERSION}" && \
	CC='/usr/bin/gcc -static' \
	CFLAGS='-fPIC' \
	CPPFLAGS="-I/opt -I/opt/openssl/src/openssl-${OPENSSL_VERSION}/include -DNETDB_INTERNAL=-1" \
	LDFLAGS="-L/opt/readline/src/readline-${READLINE_VERSION} -L/opt/ncurses/src/ncurses-${NCURSES_VERSION}/lib -L/opt/openssl/src/openssl-${OPENSSL_VERSION}" \
	./configure && \
	make -j4


#
#	RUNTIME CONTAINER
#
FROM scratch AS RUNTIME
ARG SOCAT_VERSION
ENV SOCAT_VERSION=$SOCAT_VERSION

COPY --from=BUILDER /opt/socat/src/socat-${SOCAT_VERSION}/socat /socat

ENTRYPOINT ["/socat"]
CMD ["-h"]
