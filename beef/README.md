## Usage
```bash
docker run --rm -it beef
Usage: beef [options]
    -x, --reset                      Reset the database
    -v, --verbose                    Display debug information
    -a, --ascii_art                  Prints BeEF ascii art
    -c, --config FILE                Load a different configuration file: if it's called custom-config.yaml, git automatically ignores it.
    -p, --port PORT                  Change the default BeEF listening port
    -w, --wsport WS_PORT             Change the default BeEF WebSocket listening port
    -i, --interactive                Starts with the Console Shell activated

```

## Example
```bash
docker build -t beef .
# output omitted
docker run --rm -it -p 3000:3000 --env BEEF_USER=beef-admin --env BEEF_PASSWORD=feeb beef -i
```

Example output:
```
[19:12:18][*] Bind socket [imapeudora1] listening on [0.0.0.0:2000].
[19:12:18][*] Browser Exploitation Framework (BeEF) 0.4.7.0-alpha
[19:12:18]    |   Twit: @beefproject
[19:12:18]    |   Site: http://beefproject.com
[19:12:18]    |   Blog: http://blog.beefproject.com
[19:12:18]    |_  Wiki: https://github.com/beefproject/beef/wiki
[19:12:18][*] Project Creator: Wade Alcorn (@WadeAlcorn)
[19:12:19][*] BeEF is loading. Wait a few seconds...
[19:12:28][!] API Fire Error: Permission denied @ rb_sysopen - /home/beef/extensions/admin_ui/api/../media/javascript-min/web_ui_all.js in {:owner=>BeEF::Extension::AdminUI::API::Handler, :id=>23}.mount_handler()
[19:12:28][*] 11 extensions enabled.
[19:12:28][*] 300 modules enabled.
[19:12:28][*] 2 network interfaces were detected.
[19:12:28][+] running on network interface: 127.0.0.1
[19:12:28]    |   Hook URL: http://127.0.0.1:3000/hook.js
[19:12:28]    |_  UI URL:   http://127.0.0.1:3000/ui/panel
[19:12:28][+] running on network interface: 192.168.144.2
[19:12:28]    |   Hook URL: http://192.168.144.2:3000/hook.js
[19:12:28]    |_  UI URL:   http://192.168.144.2:3000/ui/panel
[19:12:28][!] Warning: Default username and weak password in use!
[19:12:28]    |_  New password for this instance: a857a426d63634cce63c1c40b2412f9d
[19:12:28][*] RESTful API key: 74a59f56cbc3b5c20f95b935712a8eddcc579166
[19:12:28][*] HTTP Proxy: http://127.0.0.1:6789
[19:12:28][!] The console extension is currently unavailable.
[19:12:28]    |_  See issue #1090 - https://github.com/beefproject/beef/issues/1090
[19:12:28][*] BeEF server started (press control+c to stop)
```
