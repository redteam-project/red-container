FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN useradd -c 'sqlmap' -m -s /sbin/nologin sqlmap
RUN dnf upgrade -y && \
    dnf install -y \
        python2 \
        python-pip && \
    pip install sqlmap && \
    dnf clean all

USER sqlmap
ENTRYPOINT [ "sqlmap" ]
CMD [ "-h" ]