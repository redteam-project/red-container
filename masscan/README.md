## Usage

```bash
$ docker run --rm -it masscan
MASSCAN is a fast port scanner. The primary input parameters are the
IP addresses/ranges you want to scan, and the port numbers. An example
is the following, which scans the 10.x.x.x network for web servers:
 masscan 10.0.0.0/8 -p80
The program auto-detects network interface/adapter settings. If this
fails, you'll have to set these manually. The following is an
example of all the parameters that are needed:
 --adapter-ip 192.168.10.123
 --adapter-mac 00-11-22-33-44-55
 --router-mac 66-55-44-33-22-11
Parameters can be set either via the command-line or config-file. The
names are the same for both. Thus, the above adapter settings would
appear as follows in a configuration file:
 adapter-ip = 192.168.10.123
 adapter-mac = 00-11-22-33-44-55
 router-mac = 66-55-44-33-22-11
All single-dash parameters have a spelled out double-dash equivalent,
so '-p80' is the same as '--ports 80' (or 'ports = 80' in config file).
To use the config file, type:
 masscan -c <filename>
To generate a config-file from the current settings, use the --echo
option. This stops the program from actually running, and just echoes
the current configuration instead. This is a useful way to generate
your first config file, or see a list of parameters you didn't know
about. I suggest you try it now:
 masscan -p1234 --echo
```

## Example
```bash
$ docker run --rm -it masscan 10.0.0.0/24 -p80 --rate 100000000 --offline

Starting masscan 1.0.6 (http://bit.ly/14GZzcT) at 2019-03-15 16:06:57 GMT
 -- forced options: -sS -Pn -n --randomize-hosts -v --send-eth
Initiating SYN Stealth Scan
Scanning 256 hosts [1 port/host]
```

Pull the image from Docker hub.
```bash
$ docker pull trevorbryant/masscan
```

Building the image.
```bash
$ docker build -t masscan .
```

## Example Output

```bash
$ docker run --rm -it masscan 10.0.0.0/24 -p80 --rate 100000000 --offline

Starting masscan 1.0.6 (http://bit.ly/14GZzcT) at 2019-03-15 16:06:57 GMT
 -- forced options: -sS -Pn -n --randomize-hosts -v --send-eth
Initiating SYN Stealth Scan
Scanning 256 hosts [1 port/host]
```

# Sources
  - https://github.com/robertdavidgraham/masscan
  - https://danielmiessler.com/study/masscan/
  - https://hub.docker.com/r/trevorbryant/masscan
