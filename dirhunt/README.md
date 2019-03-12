## Usage

```bash
$ docker run --rm dirhunt --h

Usage: dirhunt [OPTIONS] [URLS]...

  One or more domain or urls. Load urls from files using the /full/path or
  ./relative/path.

Options:
  -t, --threads INTEGER           Number of threads to use.
  -x, --exclude-flags TEXT        Exclude results with these flags. See
                                  documentation.
  -i, --include-flags TEXT        Only include results with these flags. See
                                  documentation.
  -e, --interesting-extensions TEXT
                                  The files found with these extensions are
                                  interesting
  -f, --interesting-files TEXT    The files with these names are interesting
  --stdout-flags TEXT             Return only in stdout the urls of these
                                  flags
  --progress-enabled / --progress-disabled
  --timeout INTEGER
  --max-depth INTEGER             Maximum links to follow without increasing
                                  directories depth
  --not-follow-subdomains         The subdomains will be ignored
  --exclude-sources TEXT          Exclude source engines. Possible options:
                                  robots, virustotal, google
  -p, --proxies TEXT              Set one or more proxies to alternate between
                                  them
  -d, --delay FLOAT               Delay between requests to avoid bans by the
                                  server
  --not-allow-redirects           Redirectors will not be followed
  --limit INTEGER                 Max number of pages processed to search for
                                  directories.
  --version
  --help ```

## Example

```bash
$ docker build --rm -f dirhunt/Dockerfile -t dirhunt:latest dirhunt
```

Example output:
```
$ docker run --rm dirhunt google.com

Welcome to Dirhunt v0.6.0 using Python 3.7.2
Starting...
[301] http://google.com/  (Redirect)
    Redirect to: http://www.google.com/

........
```

# Source
https://github.com/Nekmo/dirhunt
