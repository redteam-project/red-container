FROM fedora
LABEL maintainer="security@lists.fedoraproject.org"

RUN dnf upgrade -y
RUN dnf install -y \
        glibc-locale-source \
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
        ruby \
        libcurl-devel \
        ruby-devel \
        rubygem-bundler \
        rubygem-uglifier \
        rubygem-sqlite3 \
        rubygems && \
    dnf clean all

RUN useradd -c 'beef' -m -s /sbin/nologin beef

RUN localedef -f UTF-8 -i en_US en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
WORKDIR /home/beef
RUN git clone https://github.com/beefproject/beef.git beefsrc && \
    mv beefsrc/* . && \
    rm -rf beefsrc && \
    ## This should only be temporary but the upstream Gemfile needs to be updated as described here:
    ## https://github.com/beefproject/beef/issues/1433#issuecomment-324245435
    rm -f Gemfile.lock && \
    sed -i "s/gem 'therubyracer', '~> 0.12.2', '<= 0.12.2'/gem 'therubyracer', '~> 0.12.3', '<= 0.12.3'/g" Gemfile
RUN bundle install && \
    gem source -c

RUN find /home/beef -name javascript-min -exec chown beef {} +
RUN sed -e '/get_permission$/s/^/#/' -i update-geoipdb
RUN ./update-geoipdb

EXPOSE 3000 4567 6789
COPY entrypoint.sh /home/beef
USER beef
ENTRYPOINT ["/home/beef/entrypoint.sh"]
