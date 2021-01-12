#
# BUILD CONTAINER
#
FROM ubuntu:latest as BUILDER

ENV DNSENUM_GIT_SOURCE "https://github.com/fwaeytens/dnsenum.git"
# Install git; used to pull dnsenum
RUN apt update && \
	apt install -y git

# Pull DNS Enum using git
RUN cd /opt && \
	git clone $DNSENUM_GIT_SOURCE



#
# RUNTIME CONTAINER
#
FROM ubuntu:latest

# Install perl dependencies
#	cpanminus - cpanm: Manage perl module deps
#	make	- make: cpanm requires make to build modules after retrieval
RUN apt update && \
	apt install -y make cpanminus build-essential

# Create directory for dnsenum tool
RUN mkdir -p /opt/dnsenum

# Pull dnsenum script from builder
COPY --from=BUILDER /opt/dnsenum /opt/dnsenum

WORKDIR /opt/dnsenum

# Don't run as root
RUN useradd -M dnsenum_user && \
	chmod +x dnsenum.pl && \
	chown dnsenum_user:dnsenum_user dnsenum.pl

# Setup perl modules: 
RUN cpanm Net::IP Net::DNS Net::Netmask Net::Whois::IP HTML::Parser WWW::Mechanize XML::Writer String::Random

# Remove the build-essentials (178MB)
RUN apt remove -y build-essential make && \
	apt autoremove -y 

USER dnsenum_user
ENTRYPOINT ["/opt/dnsenum/dnsenum.pl"]
CMD ["-h"]
