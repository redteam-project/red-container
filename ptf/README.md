## Usage

```bash
$ docker run --rm -it ptf

ptf> show modules

The PenTesters Framework Modules
=================================
   Name                                                 Description
   ----                                                 ---------------
   modules/install_update_all                           This will install or update all tools with modules within PTF
   modules/update_installed                             This will update all installed tools within PTF
   modules/exploitation/autosploit                      This module will install/update the AutoSploit - Automated Exploitation via Shodan and Metasploit
   modules/exploitation/badkeys                         This module will install/update ssh-badkeys - a list of known compromised sshkeys
   modules/exploitation/beef                            This module will install/update the Browser Exploitation Framework (BeEF)
   modules/exploitation/bettercap                       This module will install/update Bettercap, a complete, modular, portable and easily extensible MITM tool and framework
   modules/exploitation/birp                            This module will install/update the BIRP - Mainframe exploitation
   modules/exploitation/brutex                          This module will install/update BruteX - a brute forcing tool
   modules/exploitation/burp                            This module will install/update the Burp Suite Free - web application attacks          


```

## Example
Pull the image from Docker hub.
```bash
$ docker pull trevorbryant/ptf
```

Building the image.
```bash
$ docker build --rm -f ptf/Dockerfile -t ptf:latest ptf
```

Example output:
```
$ sudo docker run --rm -it ptf

[*] You can always type ./ptf --no-network-connection to skip the Internet check..
[*] Checking for an Internet connection...
[*] Trying to update myself first.. Then starting framework.
Already up to date.


                     ______  __ __    ___
                    |      T|  T  T  /  _]
                    |      ||  l  | /  [_
                    l_j  l_j|  _  |Y    _]
                      |  |  |  |  ||   [_
                      |  |  |  |  ||     T
                      l__j  l__j__jl_____j

 ____     ___  ____   ______    ___   _____ ______    ___  ____    _____
|    \   /  _]|    \ |      T  /  _] / ___/|      T  /  _]|    \  / ___/
|  o  ) /  [_ |  _  Y|      | /  [_ (   \_ |      | /  [_ |  D  )(   \_
|   _/ Y    _]|  |  |l_j  l_jY    _] \__  Tl_j  l_jY    _]|    /  \__  T
|  |   |   [_ |  |  |  |  |  |   [_  /  \ |  |  |  |   [_ |    \  /  \ |
|  |   |     T|  |  |  |  |  |     T \    |  |  |  |     T|  .  Y \    |
l__j   l_____jl__j__j  l__j  l_____j  \___j  l__j  l_____jl__j\_j  \___j

 _____  ____    ____  ___ ___    ___  __    __   ___   ____   __  _
|     ||    \  /    T|   T   T  /  _]|  T__T  T /   \ |    \ |  l/ ]
|   __j|  D  )Y  o  || _   _ | /  [_ |  |  |  |Y     Y|  D  )|  ' /
|  l_  |    / |     ||  \_/  |Y    _]|  |  |  ||  O  ||    / |    \
|   _] |    \ |  _  ||   |   ||   [_ l  `  '  !|     ||    \ |     Y
|  T   |  .  Y|  |  ||   |   ||     T \      / l     !|  .  Y|  .  |
l__j   l__j\_jl__j__jl___j___jl_____j  \_/\_/   \___/ l__j\_jl__j\_j
```

# Source
  - https://github.com/trustedsec/ptf
  - https://hub.docker.com/r/trevorbryant/ptf
