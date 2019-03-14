## Usage

```bash
$ docker run --rm -it dirhunt --h

Usage of /gobuster:                                                                                                                                                                                                                           
  -P string                                                                                                                                                                                                                                   
        Password for Basic Auth (dir mode only)                                                                                                                                                                                               
  -U string                                                                                                                                                                                                                                   
        Username for Basic Auth (dir mode only)                                                                                                                                                                                               
  -a string                                                                                                                                                                                                                                   
        Set the User-Agent string (dir mode only)                                                                                                                                                                                             
  -c string                                                                                                                                                                                                                                   
        Cookies to use for the requests (dir mode only)                                                                                                                                                                                       
  -cn                                                                                                                                                                                                                                         
        Show CNAME records (dns mode only, cannot be used with '-i' option)                                                                                                                                                                   
  -e    Expanded mode, print full URLs                                                                                                                                                                                                        
  -f    Append a forward-slash to each directory request (dir mode only)                                                                                                                                                                      
  -fw                                                                                                                                                                                                                                         
        Force continued operation when wildcard found                                                                                                                                                                                         
  -i    Show IP addresses (dns mode only)                                                                                                                                                                                                     
  -k    Skip SSL certificate verification
  -k    Skip SSL certificate verification                                                                                                                                                                                             [2/1986]
  -l    Include the length of the body in the output (dir mode only)
  -m string
        Directory/File mode (dir) or DNS mode (dns) (default "dir")
  -n    Don't print status codes
  -np
        Don't display progress
  -o string
        Output file to write results to (defaults to stdout)
  -p string
        Proxy to use for requests [http(s)://host:port] (dir mode only)
  -q    Don't print the banner and other noise
  -r    Follow redirects
  -s string
        Positive status codes (dir mode only) (default "200,204,301,302,307,403")
  -t int
        Number of concurrent threads (default 10)
  -to duration
        HTTP Timeout in seconds (dir mode only) (default 10s)
  -u string
        The target URL or Domain
  -v    Verbose output (errors)
  -w string
        Path to the wordlisti
  -x string
        File extension(s) to search for (dir mode only)
```

## Example
The wordlists are pulled and stored under filesystem.

/apache-user-enum-1.0.txt
/apache-user-enum-2.0.txt
/directory-list-1.0.txt
/directory-list-2.3-big.txt
/directory-list-2.3-medium.txt
/directory-list-2.3-small.txt
/directory-list-lowercase-2.3-big.txt
/directory-list-lowercase-2.3-medium.txt
/directory-list-lowercase-2.3-small.txt

```bash
$ docker build -t gobuster .
```

## Example Output

```bash
$ sudo docker run --rm -it gobuster -e -u https://redteamproject.org -w /directory-list-2.3-small.txt
                                                                              
=====================================================                        
Gobuster v2.0.1              OJ Reeves (@TheColonial)                         
=====================================================                            
[+] Mode         : dir                                                         
[+] Url/Domain   : https://redteamproject.org/                              
[+] Threads      : 10                                                         
[+] Wordlist     : /directory-list-2.3-small.txt                             
[+] Status codes : 200,204,301,302,307,403                                      
[+] Expanded     : true                                                         
[+] Timeout      : 10s                                                        
=====================================================
2019/03/14 13:27:17 Starting gobuster
=====================================================
https://redteamproject.org/index (Status: 200)
https://redteamproject.org/img (Status: 301)
https://redteamproject.org/feed (Status: 200)
...
=====================================================
2019/03/14 13:27:18 Finished
=====================================================
```

# Sources
https://github.com/OJ/gobuster
https://ops.tips/blog/dockerfile-golang/
https://github.com/daviddias/node-dirbuster/tree/master/lists
