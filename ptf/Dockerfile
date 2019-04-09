FROM alpine 
LABEL maintainer="RTP @redteamproject"

# Set up workspace
ENV PTF_HOME=/pentest
RUN mkdir ${PTF_HOME}

# Install dependencies
RUN apk add --no-cache \
    python \
    git

# Install PTF
WORKDIR ${PTF_HOME}
RUN git clone https://github.com/trustedsec/ptf.git ${PTF_HOME}
    
# Set up to run
ENTRYPOINT [ "./ptf" ]
CMD [ "--help"]
