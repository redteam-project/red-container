#
# BUILDER CONTAINER
#
FROM ubuntu:latest as BUILDER
# URL and MD5 manually transcribed 2021 Jan 12
ENV OPHCRACK_URL="https://sourceforge.net/projects/ophcrack/files/ophcrack/3.8.0/ophcrack-3.8.0.tar.bz2/download"
ENV OPHCRACK_MD5="d4449e15f65b1f0f82abfd963ceff452"

# Prepare environment to build ophcrack
RUN apt update && \
	apt install -y build-essential wget libssl-dev libexpat1-dev

RUN mkdir -p /opt/ophcrack

WORKDIR /opt/ophcrack

# Download source and verify tarball
RUN wget $OPHCRACK_URL && \
	test "$(md5sum download | cut -d " " -f1)" = $OPHCRACK_MD5

# Untar and build
RUN tar -xjvf download && \
	cd ophcrack-3.8.0 && \ 
	./configure --disable-gui && \
	make



#
# RUNTIME CONTAINER
#
FROM ubuntu:latest as RUNTIME

# Volume is used so local system can supply the rainbow tables
VOLUME /rnbwtbl

# Prepare runtime environment
RUN apt update && \
	apt install -y libexpat1 libssl-dev

# Copy binaries over
COPY --from=BUILDER /opt/ophcrack/ophcrack-3.8.0/src /opt/ophcrack

ENTRYPOINT ["/opt/ophcrack/ophcrack"] 
CMD ["-h"]

