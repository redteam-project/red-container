FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN useradd -c 'nikto' -m -s /sbin/nologin nikto
RUN dnf upgrade -y && \
    dnf install -y \
        git \
        perl-libwhisker2 \
        openssl-perl \
        perl-RPC-XML \
        perl-XMLRPC-Lite \
        perl-Net-SSLeay \
        perl-Time-HiRes \
        perl-bignum \
        perl-JSON-PP && \
    dnf clean all

WORKDIR /tmp
RUN git clone https://github.com/sullo/nikto.git && \
    cd nikto && \
    rm -rf devdocs program/docs documentation README.md && \
    mv program /usr/share/nikto && \
    cd /usr/share/nikto && \
    rm -rf /tmp/nikto && \
    mv nikto.conf /etc/nikto.conf && \
    mv nikto.pl /usr/bin/nikto && \
    echo "EXECDIR=/usr/share/nikto" >> /etc/nikto.conf

## Uninstall unnecessary packages.
RUN dnf erase -y git && \
    dnf clean all

WORKDIR /
USER nikto
CMD ["-config", "/etc/nikto.conf"]
ENTRYPOINT ["nikto"]