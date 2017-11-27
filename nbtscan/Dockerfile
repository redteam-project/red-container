FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN useradd -c 'nbtscan' -m -s /sbin/nologin nbtscan
RUN dnf upgrade -y && \
    dnf install -y \
        glibc.i686 && \
    dnf clean all && \
    cd /usr/bin && \
    curl -o nbtscan http://www.unixwiz.net/tools/nbtscan-1.0.35-redhat-linux && \
    chmod +x nbtscan

USER nbtscan
ENTRYPOINT ["nbtscan"]