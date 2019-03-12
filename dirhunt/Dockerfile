FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN useradd -c "dirhunt" -m -s /sbin/nologin dirhunt
RUN dnf upgrade -y && \
    dnf install -y \
        python3 \
        python-pip && \
    pip3 install dirhunt && \
    dnf clean all

USER dirhunt
ENTRYPOINT [ "dirhunt" ]
CMD [ "--help" ]
