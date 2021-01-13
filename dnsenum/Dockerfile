FROM ubuntu:latest
ENV DNSENUM_GIT_SOURCE "https://github.com/fwaeytens/dnsenum.git"
# Install perl dependencies
#	cpanminus - cpanm: Manage perl module deps
#	make	- make: cpanm requires make to build modules after retrieval
RUN apt update && \
	apt install -y make cpanminus build-essential git

# Pull DNS Enum using git
RUN cd /opt && \
	git clone $DNSENUM_GIT_SOURCE

WORKDIR /opt/dnsenum

# Don't run as root
RUN useradd -M dnsenum_user && \
	chmod +x dnsenum.pl && \
	chown dnsenum_user:dnsenum_user dnsenum.pl

# Setup perl modules: 
RUN cpanm Net::IP Net::DNS Net::Netmask Net::Whois::IP HTML::Parser WWW::Mechanize XML::Writer String::Random

# Remove the build-essentials (178MB)
RUN apt remove -y build-essential && \
	apt autoremove -y 

USER dnsenum_user
ENTRYPOINT ["/opt/dnsenum/dnsenum.pl"]
CMD ["-h"]
