FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"
ENV PATH=/opt/arachni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN useradd -c 'arachni' -m -s /sbin/nologin arachni
RUN dnf upgrade -y && \
    dnf clean all

WORKDIR /opt
RUN curl -L -o arachni.tar.gz "https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz" && \
    tar -xzvf arachni.tar.gz && \
    mv arachni-* arachni && \
    chown -R root arachni && \
    ## Errors if these locations aren't writable
    chown arachni \
        arachni/system/arachni-ui-web/config/component_cache \
        arachni/system/arachni-ui-web/db \
        arachni/system/arachni-ui-web/tmp \
        arachni/system/logs \
        arachni/system/home

USER arachni
CMD ["arachni", "-h"]