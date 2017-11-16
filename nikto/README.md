## Usage

```bash
docker run --rm -ti nikto
- Nikto v2.1.6
---------------------------------------------------------------------------
+ ERROR: No host specified

       -config+            Use this config file
       -Display+           Turn on/off display outputs
       -dbcheck            check database and other key files for syntax errors
       -Format+            save file (-o) format
       -Help               Extended help information
       -host+              target host
       -id+                Host authentication to use, format is id:pass or id:pass:realm
       -list-plugins       List all available plugins
       -output+            Write output to this file
       -nossl              Disables using SSL
       -no404              Disables 404 checks
       -Plugins+           List of plugins to run (default: ALL)
       -port+              Port to use (default 80)
       -root+              Prepend root value to all requests, format is /directory
       -ssl                Force ssl mode on port
       -Tuning+            Scan tuning
       -timeout+           Timeout for requests (default 10 seconds)
       -update             Update databases and plugins from CIRT.net
       -Version            Print plugin and database versions
       -vhost+             Virtual host (for Host header)
   		+ requires a value

	Note: This is the short help output. Use -H for full help text.
```

## Example

```bash
docker build -t nikto .
# output omitted
mkdir nikto
docker run --rm --mount type=bind,source="$(pwd)"/nikto,target=/nikto -ti nikto -host fedoraproject.org -output /nikto/nikto.txt
```

Example output:
```
tail nikto/nikto.txt
- Nikto v2.1.6/2.1.5
+ Target Host: fedoraproject.org
+ Target Port: 80
+ GET Server leaks inodes via ETags, header found with file /NCCGnPo3.xsql, fields: 0x351d 0x55e0e7d579c40;55e0e8450e380
+ GET Uncommon header 'tcn' found, with contents: choice
+ GET Uncommon header 'appserver' found, with contents: proxy06.fedoraproject.org
+ GET Uncommon header 'apptime' found, with contents: D=9213
+ GET "robots.txt" contains 1 entry which should be manually viewed.
+ GET Apache mod_negotiation is enabled with MultiViews, which allows attackers to easily brute force file names. See http://www.wisec.it/sectou.php?id=4698ebdc59d15. The following alternatives for 'index' were found: index.html.af, index.html.ar, index.html.as, index.html.ast, index.html.bal, index.html.bg, index.html.bn, index.html.bn_IN, index.html.br, index.html.ca, index.html.cs, index.html.da, index.html.de, index.html.de_CH, index.html.el, index.html.en, index.html.en_GB, index.html.es, index.html.eu, index.html.fa, index.html.fi, index.html.fr, index.html.gl, index.html.gu, index.html.he, index.html.hi, index.html.hu, index.html.ia, index.html.id, index.html.is, index.html.it, index.html.ja, index.html.ka, index.html.kn, index.html.ko, index.html.lv, index.html.ml, index.html.mr, index.html.nb, index.html.nl, index.html.or, index.html.pa, index.html.pl, index.html.pt, index.html.pt_BR, index.html.ro, index.html.ru, index.html.sk, index.html.sq, index.html.sr, index.html.sv, index.html.ta, index.html.te, index.html.tg, index.html.th, index.html.tr, index.html.uk, index.html.vi, index.html.zh_CN, index.html.zh_TW
+ OSVDB-2394: GET /path/nw/article.php?id=': News Wizard 2.0 reveals the file system path.
```
