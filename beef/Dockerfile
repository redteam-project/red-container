FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN useradd -c 'beef' -m -s /sbin/nologin beef
RUN dnf upgrade -y && \
    dnf install -y \
        git \
        gcc \
        make \
        gcc-c++ \
        redhat-rpm-config \
        openssl-devel \
        zlib-devel \
        sqlite-devel \
        libyaml-devel \
        libffi-devel \
        bzip2 \
        autoconf \
        automake \
        bison \
        nodejs \
        nodejs-encoding \
        ruby \
        ruby-devel \
        rubygem-bundler \
        rubygem-uglifier \
        rubygem-sqlite3 \
        rubygems && \
    dnf clean all

WORKDIR /home/beef
RUN git clone https://github.com/beefproject/beef.git beefsrc && \
    mv beefsrc/* . && \
    rm -rf beefsrc && \
    ## This should only be temporary but the upstream Gemfile needs to be updated as described here:
    ## https://github.com/beefproject/beef/issues/1433#issuecomment-324245435
    rm -f Gemfile.lock && \
    sed -i "s/gem 'therubyracer', '~> 0.12.2', '<= 0.12.2'/gem 'therubyracer', '~> 0.12.3', '<= 0.12.3'/g" Gemfile && \
    bundle install && \
    gem source -c

WORKDIR /home/beef
USER beef
ENTRYPOINT ["./beef"]
CMD ["-h"]