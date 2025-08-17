# Command line interface commands

## `find`
- The `find` command is equivalent to `find -print`
- When the output of `find` is pipped to a subsequent command such as `awk` or `xargs`, explicitly use `find -print0`
  instead of `find` or equivalently `find -print`. Explanation from `man find`:
    - "`-print0 True`; print the full file name on the standard output, followed by a null character (instead of the
      newline character that `-print` uses). This allows file names that contain newlines or other types of white space
      to be correctly interpreted by programs that process the `find` output.
    - This option corresponds to the `-0` option of `xargs`." In this case `xargs` is processing the `find` output and
      the `-print0` ensures that it correctly processes even files named with garbage like a newline character.
- The option `-type f` and `-type d` respectively specify that we want only *files* and *directories*
- The option `-name` followed by a name enables us to filter out the files and/or directories that match the specified
  name;
  the name indicated after the `-name` option flag can contain wildcards, in which case it will do pattern matching
- N.B.: the `-name` option of `find` is case sensitive
- The option `-iname` is the case *insensitive* version of `-name`
- `find ~/Documents/ -type f -name "*.md"` finds the markdown files in the `Document` folder
- `find` is recursive by default; be careful about using the command on the root directory `/` for instance
- By default, when no location is given, `find` looks for items in the current directory
- By default, when no name is given, it returns all the items (files and directories can be filtered too, see above) at
  the current or specified location in the filesystem.
- For example, `find ~/Documents/ -type f` returns (and prints in stdout) all the *files* in `Documents`.
- The option `-perm` finds only the items that have the desired permissions; for example, `-perm 0777`
- Adding an exclamation mark `!` in front of an option *negates* the option; for example, `! -perm 0777`
- The option `-mmin` followed by a *signed* number finds only the items that have been *modified*
    - *less* than the specified number of *minutes* ago if the number is *negative*; for example, `-mmin -10`
    - *more* than the specified number of *minutes* ago if the number is *positive*; for example, `-mmin +10`
- The options can be combined; as such, `-mmin +1 -mmin -5` means *more than 1 minute ago but less than 5 minutes ago*
- For *days* instead of *minutes*, we can use `-mtime` instead of `-mmin`; for example, `-mtime -20` shows only the
  items that were modified less than 20 days ago
- By symmetry, we can use `-amin` and `-atime` to filter out items with respect to the last time they were *accessed*
- By symmetry, we can use `-cmin` and `-ctime` to filter out items with respect to the last time they were *changed*
- The option `-size` specifies the size limits of the items we want to find; it is followed by a signed number
    - the sign signals whether we want items whose size exceeds the specified number (*positive* number)
      or is below it (*negative*)
- The signed number written after the `-size` option flag is in bytes and can be followed by a unit quantifier shorthand
  such as `+10k` for items more than 10 kilobytes in size, or `-500M` for items less than 500 megabytes in size
- As with the time-related options, the `-size` options can be combined; for example, `-size +10k -size -500M`
- To find dummy files that are empty (contain no data whatsoever) in the current directory, we can use `find . -empty`
- The option `-exec` followed by a bash command executes the specified bash command on the items returned by `find`
    - for it to work, we need to add a placeholder `{}` that indicates where in the command the output of `find` need
      be placed
    - in addition, the command need be ended with a special character such as `+`
    - in fine, for example, `find . -type f --exec chmod 775 {} +`
- Another example: `find . -type f -name "*.pyc" -exec rm {} +` deletes all the files that end with a `pyc` extension,
  recursively down from the current directory; preferred usage: use `trash` instead of `rm` to be able to recover it
- Another possible sequence of characters to use to close the `-exec` option is `\;`; the difference between using `+`
  and using `\;` is explained at this [StackExchange comment](https://unix.stackexchange.com/a/195940)
    - In short, `+` execute the command *once on a list* containing the output of `find`; *1 command with N inputs*
    - `\;` on the other hand executes the command *once per output*; *N commands with 1 input*
- The option `-maxdepth` allows us to limit the maximum depth at which `find` is allowed to look for items recursively

## `awk`
- `awk` is a pattern-directed scanning and processing language (this is how it is described in `man awk`)
- `awk` is centered around the concept of columns or *fields*; fields are whatever strings separated by delimiters
- By default, *spaces* are the field delimiters; as such, fields are the sub-strings between the interlacing spaces
- `ps | awk '{print $1}'` prints the first column of the output of the `ps` command; in bash, indices start at 1
- `ps | awk '{print $0}'` prints the whole output of `ps` since there is no column 0: there is nothing to select
- Same goes for `ps | awk '{print}'`, since `print` without argument is equivalent to `ps | awk '{print $0}'`
- `awk` can be used directly on the contents of a file; for example, `awk '{print $1}' /etc/passwd`
- The option `-F` (for *Field*) allows us to use something else than spaces as delimiters
- The symbol `$NF` (for *Number of Fields*) identifies the *last* column; for example, `awk '{print $NF}' /etc/passwd`
- As such, `awk -F ":" '{print $1}' /etc/passwd` now employs colons to separate the lines of the file into fields
- We can print several columns (separated by `" "` for legibility): `awk -F ":" '{print $1" "$5" "$3}' /etc/passwd`
- `awk` can filter out lines on which not to perform any operation; the pattern that a given line must match not to be
  filtered out by `awk` must be given inside the first input of `awk` (the one between quotes), before the braces; the
  pattern to match must be specified between *slashes*, and is essentially a regular expression
- For example, to only keep lines that start with a slash symbol, we can use `/^\// {print $1}` as the first input of
  the `awk` command; `^\/` says that the first character of the line must be a slash `/`, which we here need to escape
- Side note, to remove duplicates in the output of a shell command, we can pipe the output to the `uniq` command
- `awk` is capable of doing **arithmetic** and **conditional** operations; for example
    - `df | awk '{print $1 + $2}'` prints the sum of the two first columns of the output of the `df` command
    - `awk 'length($0) > 7' /etc/shells` outputs only the lines whose first field has a length greater than 7
    - `ps -ef | awk '{if($NF == "/bin/fish") print $0}'` outputs only the lines whose last field is `/bin/fish`
        - N.B.: the same output could be obtained with `ps -ef | awk '$NF == "/bin/fish"'` (**no** curly braces)
    - `awk '$1 ~ /^[b,c]/ {print $0}' .bashrc` prints the lines whose first character is either a `b` or a `c`
        - N.B.: the `~` is a pattern matching condition (here, the first character of the first field must match)
    - `awk '{print substr($0, 4)}' numbered.txt` prints every lines (or *record*) starting from the fourth character
- The *startup* and *cleanup* actions; they need be used when the content of `awk` must not be run on every line/record
    - N.B.: a line is called a *record*;
      `NR` is a variable that contains the number of records in the file/piped output
    - More information is available [here](https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html)
    - A `BEGIN` rule is executed once only, before the first input record is read
    - Likewise, an `END` rule is executed once only, after all the input is read
    - `awk 'BEGIN {for(i=1; i<=10; i++) print "The square root of ", i, "is", i*i;}'` prints the squares up to 10
    - `awk 'END {print NR}' /etc/shells` counts the number of lines/records in a file/piped output
    - It can even accumulate the number of records in several files: `awk 'END {print NR}' file1 file2 file3`
- To show the 12 first lines (records) in a file or stream, one *could* use `awk 'NR < 13' file`

## Regular expressions
- `/ /` are the boundaries used to mark the beginning and end of a regular expression
- Parenthesis `( )` can be used to create *groupings* within the regular expression
- Shorthand meta-characters
    - These sub-patterns all start with a backslash `\`
    - A white-space character is denoted by `\s`; by extensions, `\s*` means *any number of white-space characters*
    - A word character is denoted by `\w`; again, by extension, `\w*` means *any number of word characters*
        - In essence, it is a shorthand for `[a-zA-Z0-9_]`
    - A digit character is denoted by `\d`; by extension, `\d*` means *any number of digit characters*
        - In essence, it is a shorthand for `[0-9]`
    - The capital letter version of these match with the exact opposite; for example, `\S` for non-white-space
      characters and `\D` for non-digit characters
    - `.` matches with *any character*
    - `\t` matches with tabulation characters
    - `\n` matches with newline characters
    - `\r` matches with carriage-return characters
- Occurrences meta-characters
    - There are to be placed *right after a sub-pattern*
    - Follow a symbol by `*` to mean *any number of what the symbol just before says*; for example, `.*` aims to match
      with any number of occurrences of the preceding pattern, **including** zero occurrences
    - The `+` symbol is similar to `*` but **excludes** the case of zero occurrences; there need be one or more; for
      example, the pattern `.+` matches with sequences of characters containing at least one character
    - `?` is used to denote *at most one* repetition; that is, `?` covers zero or one occurrences
    - The curly brackets are used either to specify an exact number of occurrences, or a range of occurrences
        - `{m}` signifies that there need be **exactly** `m` occurrences
        - `{m,n}` signifies that there need be a number of occurrences between `m` and `n`
- Lists
    - `[ ]` matches with anything contained within the squared brackets
        - `[b,c]` matches with characters that are either `b` or `c`, and nothing else
        - `[b-e]` and `[4-8]` denote ranges within which the character need match with a value
    - `[^ ]` matches with anything `but` what is contained within the squared brackets
- Beginning and ending characters
    - The pattern that immediately *follows* `^` specifies by what the target expression must **begin** to match
    - The pattern that immediately *precedes* `$` specifies by what the target expression must **end** to match
    - For example, `^\S` means that the target must not start with a white-space character, and `\d$` that it must end
      with a digit character; N.B.: the sub-pattern after `^` or before `$` can be longer than one regexp symbol
- As for the pattern `|`, the target expression matches if it matches either the sub-pattern before or after the `|`
    - `\d|[m-p]` matches if the expression either is a digit character or a non-digit non-capital word character in the
      range spanning from letter `m` to `p`
    - Parenthesis are especially useful for the pipe symbol to specify the boundaries of the pair of sub-patterns
    - If we were to be excessively pedantic, we would write `( | )` for the "OR" operator instead of just `|`

## `xargs`
- Not all commands allow for the stdout to be piped into them as input; for these, we can use the `xargs` utility
- For example, `rm`, `echo`, `ls` do not allow us to do such a piping operation, but `grep` and `wc` do for instance
- As such, `seq 5 | echo` does not return anything; we need use `seq 5 | xargs echo` to see the output `1 2 3 4 5`
- N.B.: when a command is not specified after `xargs`, it defaults to using `echo`: `seq 5 | xargs` is actually enough
- The option `-t` (maybe for *tell*) makes `xargs` tell us what is the command that it assembles and that is run
- The option `-I` enables the use of a *placeholder* which grants us more flexibility as to how we use the piped output
    - For example, `ls | xargs -I {} echo "/my/path/{}"` prints the output of `ls` where each element of the list
      returned by `echo` is concatenated (in front) with the specified path `/my/path/`
    - `seq 1000 | xargs -I {} touch {}.txt` creates one thousand text files incrementally named
    - Now that these text files are created, running the command `ls | cut -d1. -f1 | xargs -I {} mv {}.txt {}.md` just
      renames all the files, replacing their text extensions into markdown extensions
- We can not pipe things into the `find` command either; we need use `xargs` in conjunction with `find` as well
- The option `-n` specifies the number of parameters being piped `xargs` is allowed to take *at a time*
- One can therefore establish semantic equivalences between the using `find` with the `-exec` option, and using `find`
  with a pipe to `xargs` instead of using `-exec`; it turns out that we have equivalences for both `+` and `\;` ones
- `find . -type f -name "*.pyc" | xargs rm` does the same thing as `find . -type f -name "*.pyc" -exec rm {} +`
- `find . -type f -name "*.pyc" | xargs -n 1 rm` does the same thing as `find . -type f -name "*.pyc" -exec rm {} \;`
- When using `time` in front of these command to calculate how long their complete executions last, we quickly witness
  that employing a pipe to `xargs` instead of the `-exec` option in `find` comes with a **huge gain in speed**
- The option `-r` (`--no-run-if-empty`) prevents the command specified in the `xargs` from running *if* the stdout does
  not contain any non-blanks; normally, the command is run once even if there is no input; useful when some critical 
  commands such as `kill` or `rm` are involved in what follows the `xargs` command

## `sed`
- `sed` stands for *Stream EDitor*, and is a stream editor for filtering and transforming text
- It can perform operations on files such as searching, finding, replacing, inserting, or deleting
- In essence, `sed` is a "search and replace" tool; for the most part, `sed` is used as a **substitution** utility
- `sed 11q` prints the first 11 lines of a file (it reads as *when you get to line 11 [included], quit*)
    - This is not as efficient as `head`, which is considerably faster (not surprising, since it is its sole goal)
    - N.B.: `head` prints the 10 first lines by default; `head -n 11` prints the *11* first lines
    - The presence of "11" in this `sed` command is a meme: "`sed` is better than `head` because it gives 1 more line!"
- The pattern-type expression in `sed 's/find/replace/'` reads as *substitute* ("s") the occurrences of the word "find"
  with the word "replace" *(first occurrence in each line)*
    - careful not to forget the trailing slash `/` in the pattern
- *Where is the file coming from?* is told to `sed` via an expression starting with a left chevron `<`: `<oldfile`
- By default, `sed` does not write the changes it enables one to do anywhere; a writing location must be given
- *Where to write the modified contents?* is specified with an expression starting with a right chevron `>`: `>newfile`
- For example, `sed 's/o/O/' <oldfile >newfile` writes the contents of `oldfile` in `newfile` after replacing the very
  first non-capital `o` of each line it is present in by a capital `O`; the destination file need not exist to work
- If no output file is given, `sed` will just output its result in the stdout, effectively just printing it
- To perform a global substitution of `o` by `O` in the file, we tell `sed` that the substitution is **global** by
  adding a letter `g` at the end of the pattern-type expression in `sed`: `sed 's/o/O/g' <oldfile >newfile`
- The pattern actually is `sed 's/find/replace/option'`, where the **options** are any combination of the characters:
    - `g`: make the change in all lines
        - In VIM, `:s/foo/bar/g` makes the change in the current line only, while `:%s/foo/bar/g` makes the change
          in all lines. Note how the syntax in VIM differs from the original `sed` syntax.
    - `c`: *exclusive to VIM*; asks for confirmation before matching. `sed` does not have confirmation ability.
    - `I`: make the change case-sensitive (works on BSD `sed` since macOS Big Sur; always worked on GNU `sed`)
    - `i`: *exclusive to VIM*; make the change case-insensitive
- Most often, we will want to use a global substitution since this fits most "search and replace" scenarios
- `sed` is capable of receiving input piped from another command's output: `echo "Hello" | sed 's/Hello/Hi/'`
- The option `-i` (shorthand for `--in-place`) edits the file(s) **in place** (write to the very file it reads from)
    - in the case of an in-place operation, no need for a left chevron `<` in front of the provided source location
    - `sed -i 's/o/O/g' oldandnew`
      reads from `oldandnew` and writes the result of its global substitution to `oldandnew`
- Behavior with respect to regular expressions
    - `sed` can find either an exact match for a specified string, *or an expression that matches a given pattern*
- The first letter of the pattern-type expression that `sed` takes as parameter can be preceded by a **line pattern**
    - A line pattern **always** starts with a delimiter symbol, typically slash `/`
    - Such a line pattern filters out the lines on which `sed` operates: if the lines does not match, `sed` skips it
    - In the case of `sed`, *the line matches the pattern* means that it contains the string that is specified
    - `sed '/line_pattern/s/o/O/g' file` replaces all occurrences of `o` by `O` only on lines matching the line pattern
- In the same vein (line pattern matching), `sed` is capable of deleting lines that match a line pattern (see above)
    - The fact that we want to perform a *deletion* as opposed to a substitution is signaled via the use of `d`
    - `sed '/line_pattern/d' file` deletes the lines of `file` that match the specified line pattern
- The option `-e` allows for the use of more than one pattern-type expression in `sed` ("e" for *Expression*)
    - For example, `sed -e 's/o/O/g' -e 's/u/U/g' file` replaces *both* `o` by `O` and `u` by `U`
    - This is also doable by juxtraposing other patterns with semi-colons: `sed 's/ab/~~/g; s/~~/bc/g'`
- The slash `/` is not the only delimiter symbol that can be used in `sed`: pipe `|` and pound `#` can be used as well
- The alternate symbols `|` and `#` are useful for when the patterns (especially regular expression) contain slashes
- In addition to `s` and `d` in the operations that `sed` can carry out, there is `p` which simply stands for *print*
    - `p` is used when we want to neither substitute (`s`) nor delete (`d`); it essentially acts as a *dummy* operation
    - The existence of a dummy operation such as `p` enables `sed` to force the presence of an operation in the pattern
    - The operation `p` is commonly used in conjunction with the `-n` option (shorthand for `--quiet, --silent`) which
      inhibits the default behavior of `sed` consisting in printing the whole (possibly modified) input
    - In `sed -n '/usr/p'`, `-n` prevents `sed` from printing the unchanged input, and `p` prints the lines that match
      the pattern `usr` in the file or stream to the `sed` command
- One of the most useful things one can do with `sed` is **getting rid of trailing white-spaces**
    - `sed -i 's/ *$//' test.sh` replaces trailing white-space characters with nothing, effectively removing them
    - `sed -i '/^$/d'` deletes the empty lines in the input file or stream
- `sed` is also capable of replacing lowercase characters with uppercase characters and vice versa
    - `sed 's/[a-z]/\U&/g' test.sh` replaces the lowercase alpha letters with their uppercase versions (`\U&` magic)
    - `sed 's/[A-Z]/\L&/g' test.sh` replaces the uppercase alpha letters with their lowercase versions (`\L&` magic)

## `grep`
- `grep` is a file pattern searcher (described as such in `man grep`)
- There is no need to pipe a file to `grep` to look for matches within it: `grep` accepts files as input directly
- It is far more efficient and less nonsensical to use `grep i3 config` rather than `cat config | grep i3`
- N.B.: `awk` can do pretty much anything `grep` can; for example, `grep i3 config` is equivalent to `awk /i3/ config`,
  but still, neither `awk` nor `sed` is as efficient at this operation as `grep` is
- The option `-i` (shorthand for `--ignore-case`) makes `grep` insensitive to the case of the pattern we are seeking
- `grep` accepts regular expressions: `grep ^im file.sh` returns the lines from the file that start with `im`
- The option `-A` (shorthand for `--after-context`) followed by a number N prints the N lines following *each* match
- By symmetry, the option `-B` carries out the same operation but prints the N lines *before* each match, not after
- Finally, `-C` is a combination of `-A` and `-B`: it prints the N lines before *and* the N lines after
- `grep` can be run on several files at the same time using **wild-cards**: `grep i3 ./*` to search through every file
  in the current directory; note, grep does not accept directories as input, we need to be cunning in this respect
- In the case where one uses `grep` on more than one file, it might be clearer to display the name of the file in front
  of each match: this is done by the `-H` option; one can also display the line number in the file with `-n`
    - The use of both `-H` and `-n` in conjunction is thus advised when scanning several files: `grep -Hn i3 ./*`
- `grep` can also be used to count the number of occurrences of a pattern (each line counts most as one) with `-c`
    - `grep -c import file.sh` returns the number of lines that contain the "import" string
- The option `-v` (shorthand for `--invert-match`) selects **non-matching** lines: `grep -v pattern filename`
- N.B.: it is easy to forget that `grep` searches for the pattern *inside* files, not in their names!
    - My most frequent usage of the command consists in **filtering file names** however; with `ll | grep pattern`

## Compress / uncompress
- `tar -xvf foo.tar` extracts the `tar` file
- `tar -xvzf foo.tar.gz` extracts and uncompress the `tar.gz` file
- `tar -xvjf foo.tar.bz2` extracts and uncompress the `tar.bz2` file
To do the reverse (compress or package instead of extract or uncompress), replace the `-x` option from these with `-c`.
By specifying a file name or a director name afterwards, we tell the command to only extract the specified entity.
Using the option `-t` instead of the `-x` option lists the contents of the archive, not doing anything other than that.

## Extras
- `uniq`
- `time`
- `rsync`
- `tail`
- `head`
- `watch`
- `cut`
- `echo "# My Title" >> README.md` create a markdown file and adds a first title line in it
- `< file` print the content of the file in the STDOUT
    - It is semantically equivalent to `cat file` but uses no extra program
    - Reminder: `<` redirects the file after `<` to the stdin of the program before `<`
    - In this case, since there is nothing before the symbol `<` the file is piped to the stdout (printed)
- The difference between `>` and `>>` is that `>` **overwrites the file** as it redirects an output to a file, while
  the `>>` operation **concatenates/appends** the redirected output at the end of the file it redirects an output to
- `du -sh <file or folder>`: estimate file or folder space usage
    - `dua i <file or folder>`: uses a more recent (Rust-based) evolution of `du` that looks like `ncdu`
- `df -h`: report file system disk space usage

