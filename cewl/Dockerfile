FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN useradd -c 'cewl' -m -s /sbin/nologin cewl
RUN dnf upgrade -y && \
    dnf install -y \
        git \
        gcc \
        redhat-rpm-config \
        zlib-devel \
        ruby-devel \
        rubygem-bundler \
        rubygems \
        rubygem-json && \
    dnf clean all

WORKDIR /tmp
RUN git clone https://github.com/digininja/CeWL.git && \
    mv CeWL /usr/share/cewl && \
    cd /usr/share/cewl && \
    mv cewl.rb cewl && \
    bundle install && \
    gem source -c

## Uninstall unnecessary packages.
RUN dnf erase -y \
        git \
        gcc \
        redhat-rpm-config \
        rubygem-bundler && \
    dnf clean all

WORKDIR /usr/share/cewl
USER cewl
CMD ["-h"]
ENTRYPOINT ["./cewl"]