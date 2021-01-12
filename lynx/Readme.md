## Container usage example
docker run -it lynx "<options> <url>"
Example: docker run -it lynx "google.com"
NOTE: `-it` is required to hold the interactive terminal open

USAGE: lynx [options] [file]
Options are:
  -                 receive options and arguments from stdin
  -accept_all_cookies 
                    accept cookies without prompting if Set-Cookie handling
                    is on (off)
  -anonymous        apply restrictions for anonymous account,
                    see also -restrictions
  -assume_charset=MIMEname
                    charset for documents that don't specify it
  -assume_local_charset=MIMEname
                    charset assumed for local files
  -assume_unrec_charset=MIMEname
                    use this instead of unrecognized charsets
  -auth=id:pw       authentication information for protected documents
  -base             prepend a request URL comment and BASE tag to text/html
                    outputs for -source dumps
  -bibhost=URL      local bibp server (default http://bibhost/)
  -book             use the bookmark page as the startfile (off)
  -buried_news      toggles scanning of news articles for buried references (on)
  -cache=NUMBER     NUMBER of documents cached in memory
  -case             enable case sensitive user searching (off)
  -center           toggle center alignment in HTML TABLE (off)
  -cfg=FILENAME     specifies a lynx.cfg file other than the default
  -child            exit on left-arrow in startfile, and disable save to disk
  -child_relaxed    exit on left-arrow in startfile (allows save to disk)
  -cmd_log=FILENAME log keystroke commands to the given file
  -cmd_script=FILENAME
                    read keystroke commands from the given file
                    (see -cmd_log)
  -collapse_br_tags toggles collapsing of BR tags (on)
  -connect_timeout=N
                    set the N-second connection timeout (18000)
  -convert_to=FORMAT
                    convert input, FORMAT is in MIME type notation
                    (experimental)
  -cookie_file=FILENAME
                    specifies a file to use to read cookies
  -cookie_save_file=FILENAME
                    specifies a file to use to store cookies
  -cookies          toggles handling of Set-Cookie headers (on)
  -core             toggles forced core dumps on fatal errors (off)
  -crawl            with -traversal, output each page to a file
                    with -dump, format output as with -traversal, but to stdout
  -curses_pads      uses curses pad feature to support left/right shifting (on)
  -debug_partial    incremental display stages with MessageSecs delay (off)
  -default_colors   use terminal default foreground/background colors (on)
  -delay=NNN        set NNN-second delay at statusline message (0.000)
  -display=DISPLAY  set the display variable for X exec'ed programs
  -display_charset=MIMEname
                    charset for the terminal output
  -dont_wrap_pre    inhibit wrapping of text in <pre> when -dump'ing and
                    -crawl'ing, mark wrapped lines in interactive session (off)
  -dump             dump the first file to stdout and exit
  -editor=EDITOR    enable edit mode with specified editor
  -emacskeys        enable emacs-like key movement (off)
  -enable_scrollback 
                    toggles compatibility with comm programs' scrollback
                    keys (may be incompatible with some curses packages) (off)
  -error_file=FILE  write the HTTP status code here
  -exec             enable local program execution
  -force_empty_hrefless_a 
                    force HREF-less 'A' elements to be empty (close them as
                    soon as they are seen) (off)
  -force_html       forces the first document to be interpreted as HTML (off)
  -force_secure     toggles forcing of the secure flag for SSL cookies (off)
  -forms_options    toggles forms-based vs old-style options menu (on)
  -from             toggle transmission of From headers (on)
  -ftp              disable ftp access (off)
  -get_data         user data for get forms, read from stdin,
                    terminated by '---' on a line
  -head             send a HEAD request (off)
  -help             print this usage message
  -hiddenlinks=[option]
                    hidden links: options are merge, listonly, or ignore
  -historical       toggles use of '>' or '-->' as terminator for comments (off)
  -homepage=URL     set homepage separate from start page
  -html5_charsets   toggles use of HTML5 charset replacements (off)
  -image_links      toggles inclusion of links for all images (off)
  -index=URL        set the default index file to URL
  -ismap            toggles inclusion of ISMAP links when client-side
                    MAPs are present (off)
  -justify          do justification of text (off)
  -link=NUMBER      starting count for lnk#.dat files produced by -crawl (0)
  -list_decoded     with -dump, forces it to decode URL-encoded links (on)
  -list_inline      with -dump, forces it to show links inline with text (off)
  -listonly         with -dump, forces it to show only the list of links (off)
  -localhost        disable URLs that point to remote hosts (off)
  -locexec          enable local program execution from local files only (off)
  -lss=FILENAME     specifies a lynx.lss file other than the default
  -mime_header      include mime headers and force source dump
  -minimal          toggles minimal versus valid comment parsing (off)
  -nested_tables    toggles nested-tables logic (on)
  -newschunksize=NUMBER
                    number of articles in chunked news listings
  -newsmaxchunk=NUMBER
                    maximum news articles in listings before chunking
  -nobold           disable bold video-attribute
  -nobrowse         disable directory browsing
  -nocc             disable Cc: prompts for self copies of mailings (off)
  -nocolor          turn off color support
  -noexec           disable local program execution (DEFAULT) (on)
  -nofilereferer    disable transmission of Referer headers for file URLs (on)
  -nolist           disable the link list feature in dumps (off)
  -nolog            disable mailing of error messages to document owners (on)
  -nomargins        disable the right/left margins in the default
                    style-sheet (off)
  -nomore           disable -more- string in statusline messages
  -nonrestarting_sigwinch 
                    make window size change handler non-restarting (off)
  -nonumbers        disable the link/form numbering feature in dumps (off)
  -nopause          disable forced pauses for statusline messages
  -noprint          disable some print functions, like -restrictions=print (off)
  -noredir          don't follow Location: redirection (off)
  -noreferer        disable transmission of Referer headers (off)
  -noreverse        disable reverse video-attribute
  -nostatus         disable the miscellaneous information messages (off)
  -notitle          disable the title at the top of each page (off)
  -nounderline      disable underline video-attribute
  -nozap=DURATION ("initially" or "full") disable checks for 'z' key
  -number_fields    force numbering of links as well as form input fields (off)
  -number_links     force numbering of links (off)
  -partial          toggles display partial pages while downloading (on)
  -partial_thres    [=NUMBER]
                    number of lines to render before repainting display
                    with partial-display logic (-1)
  -passive_ftp      toggles passive ftp connection (on)
  -pauth=id:pw      authentication information for protected proxy server
  -popup            toggles handling of single-choice SELECT options via
                    popup windows or as lists of radio buttons (off)
  -post_data        user data for post forms, read from stdin,
                    terminated by '---' on a line
  -preparsed        show parsed text/html with -source and in source view
                    to visualize how lynx behaves with invalid HTML (off)
  -prettysrc        do syntax highlighting and hyperlink handling in source
                    view (off)
  -print            enable print functions (DEFAULT), opposite of -noprint (on)
  -pseudo_inlines   toggles pseudo-ALTs for inlines with no ALT string (on)
  -raw              toggles default setting of 8-bit character translations
                    or CJK mode for the startup character set (off)
  -realm            restricts access to URLs in the starting realm (off)
  -read_timeout=N   set the N-second read-timeout (18000)
  -reload           flushes the cache on a proxy server
                    (only the first document affected) (off)
  -restrictions=[options]
                    use -restrictions to see list
  -resubmit_posts   toggles forced resubmissions (no-cache) of forms with
                    method POST when the documents they returned are sought
                    with the PREV_DOC command or from the History List (off)
  -rlogin           disable rlogins (off)
  -scrollbar        toggles showing scrollbar (off)
  -scrollbar_arrow  toggles showing arrows at ends of the scrollbar (on)
  -selective        require .www_browsable files to browse directories
  -session=FILENAME resumes from specified file on startup and
                    saves session to that file on exit
  -sessionin=FILENAME
                    resumes session from specified file
  -sessionout=FILENAME
                    saves session to specified file
  -short_url        enables examination of beginning and end of long URL in
                    status line (off)
  -show_cfg         Show `LYNX.CFG' setting (off)
  -show_cursor      toggles hiding of the cursor in the lower right corner (on)
  -show_rate        toggles display of transfer rate (on)
  -socks5-proxy=URL (via which) SOCKS5 proxy to connect (unrelated to -nosocks!)
  -soft_dquotes     toggles emulation of the old Netscape and Mosaic
                    bug which treated '>' as a co-terminator for
                    double-quotes and tags (off)
  -source           dump the source of the first file to stdout and exit
  -stack_dump       disable SIGINT cleanup handler (off)
  -startfile_ok     allow non-http startfile and homepage with -validate (off)
  -stderr           write warning messages to standard error when -dump
                    or -source is used (off)
  -stdin            read startfile from standard input (off)
  -syslog=text      information for syslog call
  -syslog_urls      log requested URLs with syslog (off)
  -tagsoup          use TagSoup rather than SortaSGML parser (off)
  -telnet           disable telnets (off)
  -term=TERM        set terminal type to TERM
  -tlog             toggles use of a Lynx Trace Log for the current
                    session (on)
  -tna              turn on "Textfields Need Activation" mode (off)
  -trace            turns on Lynx trace mode (off)
  -trace_mask       customize Lynx trace mode (0)
  -traversal        traverse all http links derived from startfile
  -trim_blank_lines 
                    toggle trimming of leading/trailing/collapsed-br blank lines (on)
  -trim_input_fields 
                    trim input text/textarea fields in forms (off)
  -underline_links  toggles use of underline/bold attribute for links (off)
  -underscore       toggles use of _underline_ format in dumps (off)
  -unique_urls      toggles use of unique-urls setting for -dump and -listonly options (off)
  -update_term_title enables updating the title of terminal emulators (off)
  -use_mouse        turn on mouse support (off)
  -useragent=Name   set alternate Lynx User-Agent header
  -validate         accept only http URLs (meant for validation)
                    implies more restrictions than -anonymous, but
                    goto is allowed for http and https (off)
  -verbose          toggles [LINK], [IMAGE] and [INLINE] comments
                    with filenames of these images (on)
  -version          print Lynx version information
  -vikeys           enable vi-like key movement (off)
  -width=NUMBER     screen width for formatting of dumps (default is 80)
  -with_backspaces  emit backspaces in output if -dumping or -crawling
                    (like 'man' does) (off)
  -xhtml_parsing    enable XHTML 1.0 parsing (off)
