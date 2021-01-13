FROM ubuntu:latest as BUILDER
ARG HYDRA_VER="9.1"

# Setup Build environment
RUN apt update && \
    	apt install -y build-essential wget

# Get hydra sources and compile
RUN mkdir -p /opt/hydra && \
	cd /opt/hydra && \
        wget "https://github.com/vanhauser-thc/thc-hydra/archive/v${HYDRA_VER}.tar.gz" && \
        tar -xzf "v${HYDRA_VER}.tar.gz" && \
        cd "thc-hydra-${HYDRA_VER}" && \
        ./configure --disable-xhydra && \
        make && \
	make install


RUN adduser \
        --disabled-password \
        --gecos "" \
        --home /tmp \
        --shell /sbin/nologin \
        --no-create-home \
        --uid 10001 \
        hydra

ARG SECLIST_VER="2020.3"
# Get password & login lists ~970 MB
RUN mkdir -p /tmp/seclists && \
    	wget --progress=bar "https://github.com/danielmiessler/SecLists/archive/${SECLIST_VER}.tar.gz"

RUN tar -xzf $SECLIST_VER.tar.gz -C /tmp/seclists && \
            	mv "/tmp/seclists/SecLists-${SECLIST_VER}/Passwords" /opt/passwords && \
            	mv "/tmp/seclists/SecLists-${SECLIST_VER}/Usernames" /opt/usernames && \
		chmod -R u+r /opt/passwords /opt/usernames && \
            	rm -Rf /tmp/seclists

# Clean up the build support dependencies
RUN apt purge -y build-essential wget && \
	apt autoremove -y

USER hydra:hydra
ENTRYPOINT ["/usr/local/bin/hydra"]
CMD ["-h"]

