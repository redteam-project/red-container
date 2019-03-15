FROM ubuntu:bionic 
LABEL maintainer="RTP @redteamproject"

# Set up workspace
ENV SCAN_HOME=/home/masscan
RUN mkdir ${SCAN_HOME}

# Create unprivileged user
RUN groupadd --system masscan && \
    useradd --system --comment "masscan user" --gid="masscan" masscan

# Install dependencies
RUN apt update && apt -y install \
    clang \
    git \
    gcc \
    make \
    libpcap-dev

# Install masscan
WORKDIR ${SCAN_HOME}
RUN chown -R masscan:masscan ${SCAN_HOME} && \
    git clone https://github.com/robertdavidgraham/masscan.git ${SCAN_HOME} && \
    make && pwd && ls -la

WORKDIR ${SCAN_HOME}
USER masscan:masscan
ENTRYPOINT [ "bin/masscan" ]
CMD [ "--help"]
