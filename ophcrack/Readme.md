## CONTAINER USAGE
```docker run ophcrack "<options>"```
```docker run --rm -v ./rnbwtbl:/rnbwtbl ophcrack "-o /output/test.out https://0.0.0.0:8180"```

## Tool help output
ophcrack 3.8.0 by Objectif Securite (http://www.objectif-securite.ch)

Usage: ophcrack [OPTIONS]
Cracks Windows passwords with Rainbow tables

  -a              disable audit mode (default)
  -A              enable audit mode
  -b              disable bruteforce
  -B              enable bruteforce (default)
  -c config_file  specify the config file to use
  -D              display (lots of!) debugging information
  -d dir          specify tables base directory
  -e              do not display empty passwords
  -f file         load hashes from the specified file (pwdump or session)
  -g              disable GUI
  -h              display this information
  -i              hide usernames
  -I              show usernames (default)
  -l file         log all output to the specified file
  -n num          specify the number of threads to use
  -o file         write cracking output to file in pwdump format
  -p num          preload (0 none, 1 index, 2 index+end, 3 all default)
  -q              quiet mode
  -r              launch the cracking when ophcrack starts (GUI only)
  -s              disable session auto-saving
  -S session_file specify the file to use to automatically save the progress of the search
  -u              display statistics when cracking ends
  -t table1[,a[,b,...]][:table2[,a[,b,...]]]
                  specify which table to use in the directory given by -d
  -v              verbose
  -w dir          load hashes from encrypted SAM file in directory dir
  -x file         export data in CSV format to file


Example:	ophcrack -g -d /path/to/tables -t xp_free_fast,0,3:vista_free -f in.txt

		Launch ophcrack in command line using tables 0 and 3 in
		/path/to/tables/xp_free_fast and all tables in /path/to/tables/vista_free
		and cracks hashes from pwdump file in.txt

