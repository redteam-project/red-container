Building the image:
```bash
$ docker build -t netcat .
```

## Usage

```bash
docker run --rm -it netcat

connect to somewhere:	nc [-options] hostname port[s] [ports] ... 
listen for inbound:	nc -l -p port [-options] [hostname] [port]
options:
	-c shell commands	as `-e'; use /bin/sh to exec [dangerous!!]
	-e filename		program to exec after connect [dangerous!!]
	-b			allow broadcasts
	-g gateway		source-routing hop point[s], up to 8
	-G num			source-routing pointer: 4, 8, 12, ...
	-h			this cruft
	-i secs			delay interval for lines sent, ports scanned
        -k                      set keepalive option on socket
	-l			listen mode, for inbound connects
	-n			numeric-only IP addresses, no DNS
	-o file			hex dump of traffic
	-p port			local port number
	-r			randomize local and remote ports
	-q secs			quit after EOF on stdin and delay of secs
	-s addr			local source address
	-T tos			set Type Of Service
	-t			answer TELNET negotiation
	-u			UDP mode
	-v			verbose [use twice to be more verbose]
	-w secs			timeout for connects and final net reads
	-C			Send CRLF as line-ending
	-z			zero-I/O mode [used for scanning]
port numbers can be individual or ranges: lo-hi [inclusive];

```
## Examples

Basic port scanning with reverse DNS:
```bash
docker run --rm -it netcat -v example.com 1-1000
```

Starting a Netcat server to send data to:
```bash
docker run -t --rm -p 8888:8888 --name=ncs netcat -vl 8888
```
For persistent container:
```bash
docker run -d -i -p 8888:8888 --name=ncs  netcat -vl 8888
```

Then in a separate session run the below and enter a message to see it appear at the initial session:
```bash
docker run -i --rm netcat localhost 8888
this is a test message
```

### Using a Dedicated Network

Create the network:
```bash
docker network create --driver bridge rednet
```

Use the network name and open the port:
```bash
docker run -i --rm --network=rednet --name=ncs netcat -vl 8888
```
