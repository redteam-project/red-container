## Usage
```bash
docker run --rm -it cewl
CeWL 5.4 (Break Out) Robin Wood (robin@digi.ninja) (https://digi.ninja/)
Usage: cewl [OPTION] ... URL
	--help, -h: show help
	--keep, -k: keep the downloaded file
	--depth x, -d x: depth to spider to, default 2
	--min_word_length, -m: minimum word length, default 3
	--offsite, -o: let the spider visit other sites
	--write, -w file: write the output to the file
	--ua, -u user-agent: user agent to send
	--no-words, -n: don't output the wordlist
	--meta, -a include meta data
	--meta_file file: output file for meta data
	--email, -e include email addresses
	--email_file file: output file for email addresses
	--meta-temp-dir directory: the temporary directory used by exiftool when parsing files, default /tmp
	--count, -c: show the count for each word found

	Authentication
		--auth_type: digest or basic
		--auth_user: authentication username
		--auth_pass: authentication password

	Proxy Support
		--proxy_host: proxy host
		--proxy_port: proxy port, default 8080
		--proxy_username: username for proxy, if required
		--proxy_password: password for proxy, if required

	Headers
		--header, -H: in format name:value - can pass multiple

	--verbose, -v: verbose
	--debug: extra debug information

	URL: The site to spider.
```


## Example
```bash
docker build -t cewl .
# output omitted
mkdir cewl
docker run --rm --mount type=bind,source="$(pwd)"/cewl,target=/cewl -ti cewl fedoraproject.org -o -m 6 -w /cewl/words
```

Example output:
```
tail -10 cewl/words
Nothing
represents
misled
Specific
solely
seeking
Mailing
Translation
Interest
License
```
