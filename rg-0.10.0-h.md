ripgrep 0.10.0
Andrew Gallant <jamslam@gmail.com>

ripgrep (rg) recursively searches your current directory for a regex pattern.
By default, ripgrep will respect your .gitignore and automatically skip hidden
files/directories and binary files.

ripgrep's default regex engine uses finite automata and guarantees linear
time searching. Because of this, features like backreferences and arbitrary
look-around are not supported. However, if ripgrep is built with PCRE2, then
the --pcre2 flag can be used to enable backreferences and look-around.

ripgrep supports configuration files. Set RIPGREP_CONFIG_PATH to a
configuration file. The file can specify one shell argument per line. Lines
starting with '#' are ignored. For more details, see the man page or the
README.

Project home page: https://github.com/BurntSushi/ripgrep

Use -h for short descriptions and --help for more details.

```bash
USAGE:
    rg [OPTIONS] PATTERN [PATH ...]
    rg [OPTIONS] [-e PATTERN ...] [-f PATTERNFILE ...] [PATH ...]
    rg [OPTIONS] --files [PATH ...]
    rg [OPTIONS] --type-list
    command | rg [OPTIONS] PATTERN

ARGS:
    <PATTERN>    A regular expression used for searching.
    <PATH>...    A file or directory to search.

OPTIONS:
    -A, --after-context <NUM>               Show NUM lines after each match.
    -B, --before-context <NUM>              Show NUM lines before each match.
        --block-buffered                    Force block buffering.
    -b, --byte-offset                       Print the 0-based byte offset for each matching line.
    -s, --case-sensitive                    Search case sensitively (default).
        --color <WHEN>                      Controls when to use color.
        --colors <COLOR_SPEC>...            Configure color settings and styles.
        --column                            Show column numbers.
    -C, --context <NUM>                     Show NUM lines before and after each match.
        --context-separator <SEPARATOR>     Set the context separator string.
    -c, --count                             Only show the count of matching lines for each file.
        --count-matches                     Only show the count of individual matches for each file.
        --crlf                              Support CRLF line terminators (useful on Windows).
        --debug                             Show debug messages.
        --dfa-size-limit <NUM+SUFFIX?>      The upper size limit of the regex DFA.
    -E, --encoding <ENCODING>               Specify the text encoding of files to search.
    -f, --file <PATTERNFILE>...             Search for patterns from the given file.
        --files                             Print each file that would be searched.
    -l, --files-with-matches                Only print the paths with at least one match.
        --files-without-match               Only print the paths that contain zero matches.
    -F, --fixed-strings                     Treat the pattern as a literal string.
    -L, --follow                            Follow symbolic links.
    -g, --glob <GLOB>...                    Include or exclude files.
    -h, --help                              Prints help information. Use --help for more details.
        --heading                           Print matches grouped by each file.
        --hidden                            Search hidden files and directories.
        --iglob <GLOB>...                   Include or exclude files case insensitively.
    -i, --ignore-case                       Case insensitive search.
        --ignore-file <PATH>...             Specify additional ignore files.
    -v, --invert-match                      Invert matching.
        --json                              Show search results in a JSON Lines format.
        --line-buffered                     Force line buffering.
    -n, --line-number                       Show line numbers.
    -x, --line-regexp                       Only show matches surrounded by line boundaries.
    -M, --max-columns <NUM>                 Don't print lines longer than this limit.
    -m, --max-count <NUM>                   Limit the number of matches.
        --max-depth <NUM>                   Descend at most NUM directories.
        --max-filesize <NUM+SUFFIX?>        Ignore files larger than NUM in size.
        --mmap                              Search using memory maps when possible.
    -U, --multiline                         Enable matching across multiple lines.
        --multiline-dotall                  Make '.' match new lines when multiline is enabled.
        --no-config                         Never read configuration files.
        --no-filename                       Never print the file path with the matched lines.
        --no-heading                        Don't group matches by each file.
        --no-ignore                         Don't respect ignore files.
        --no-ignore-global                  Don't respect global ignore files.
        --no-ignore-messages                Suppress gitignore parse error messages.
        --no-ignore-parent                  Don't respect ignore files in parent directories.
        --no-ignore-vcs                     Don't respect VCS ignore files.
    -N, --no-line-number                    Suppress line numbers.
        --no-messages                       Suppress some error messages.
        --no-mmap                           Never use memory maps.
        --no-pcre2-unicode                  Disable Unicode mode for PCRE2 matching.
    -0, --null                              Print a NUL byte after file paths.
        --null-data                         Use NUL as a line terminator instead of \n.
        --one-file-system                   Do not descend into directories on other file systems.
    -o, --only-matching                     Print only matches parts of a line.
        --passthru                          Print both matching and non-matching lines.
        --path-separator <SEPARATOR>        Set the path separator.
    -P, --pcre2                             Enable PCRE2 matching.
        --pre <COMMAND>                     search outputs of COMMAND FILE for each FILE
        --pre-glob <GLOB>...                Include or exclude files from a preprocessing command.
    -p, --pretty                            Alias for --color always --heading --line-number.
    -q, --quiet                             Do not print anything to stdout.
        --regex-size-limit <NUM+SUFFIX?>    The upper size limit of the compiled regex.
    -e, --regexp <PATTERN>...               A pattern to search for.
    -r, --replace <REPLACEMENT_TEXT>        Replace matches with the given text.
    -z, --search-zip                        Search in compressed files.
    -S, --smart-case                        Smart case search.
        --sort <SORTBY>                     Sort results in ascending order. Implies --threads=1.
        --sortr <SORTBY>                    Sort results in descending order. Implies --threads=1.
        --stats                             Print statistics about this ripgrep search.
    -a, --text                              Search binary files as if they were text.
    -j, --threads <NUM>                     The approximate number of threads to use.
        --trim                              Trim prefixed whitespace from matches.
    -t, --type <TYPE>...                    Only search files matching TYPE.
        --type-add <TYPE_SPEC>...           Add a new glob for a file type.
        --type-clear <TYPE>...              Clear globs for a file type.
        --type-list                         Show all supported file types.
    -T, --type-not <TYPE>...                Do not search files matching TYPE.
    -u, --unrestricted                      Reduce the level of "smart" searching.
    -V, --version                           Prints version information
        --vimgrep                           Show results in vim compatible format.
    -H, --with-filename                     Print the file path with the matched lines.
    -w, --word-regexp                       Only show matches surrounded by word boundaries.
```