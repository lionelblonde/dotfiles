# Cheat Sheet

- Shell
    - `du -sh <file or folder>` : estimate file or folder space usage
    - `df -h` : report file system disk space usage
- Sublime Text 3
    - <kbd>command</kbd> + <kbd>d</kbd> : add next identical item to selection
    - <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>up</kbd> / <kbd>down</kbd> :
    multi-cursor
    - <kbd>command</kbd> + <kbd>/</kbd> : toggle/untoggle comment
- macOS
    - <kbd>command</kbd> + <kbd>shift</kbd> + <kbd>.</kbd> : show/hide hidden files
    - <kbd>shift</kbd> + *double click on title bar* : maximize/demaximize
    - Moving the cursor/Arrow keys
        - <kbd>control</kbd> + <kbd>b</kbd> : move backward one character
        - <kbd>control</kbd> + <kbd>f</kbd> : move forward one character
        - <kbd>control</kbd> + <kbd>p</kbd> : previous command (up arrow)
        - <kbd>control</kbd> + <kbd>n</kbd> : next command (down arrow)
        - <kbd>control</kbd> + <kbd>a</kbd> : go to the beginning of the line (Home)
        - <kbd>control</kbd> + <kbd>e</kbd> : go to the end of the line (End)
    - Delete/Modify
        - <kbd>control</kbd> + <kbd>d</kbd> : delete character from left to right
        - <kbd>control</kbd> + <kbd>h</kbd> : delete character from right to left
        - <kbd>control</kbd> + <kbd>u</kbd> : delete from cursor to beginning of line
        - <kbd>control</kbd> + <kbd>k</kbd> : delete from cursor to end of line
        - <kbd>control</kbd> + <kbd>w</kbd> : erase word to the left
        - <kbd>control</kbd> + <kbd>t</kbd> : transpose characters around cursor
- Vim
    - Motions
        - Motions that can be preceded by a count
            - <kbd>h</kbd> : move one character left
            - <kbd>j</kbd> : move one row down
            - <kbd>k</kbd> : move one row up
            - <kbd>l</kbd> : move one character right
            - <kbd>w</kbd> : move to beginning of next word
            - <kbd>b</kbd> : move to previous beginning of word
            - <kbd>e</kbd> : move to end of next word
            - <kbd>g</kbd> <kbd>e</kbd> : move to previous end of word
            - <kbd>W</kbd> : move to beginning of next word after a whitespace
            - <kbd>B</kbd> : move to beginning of previous word before a whitespace
            - <kbd>E</kbd> : move to end of word before a whitespace
        - Motions that are used alone
            - <kbd>0</kbd> : (zero) move to beginning of line
            - <kbd>$</kbd> : move to end of line
            - <kbd>^</kbd> : move to first non-blank character of the line
            - <kbd>g</kbd> <kbd>g</kbd> : move to first line
            - <kbd>G</kbd> : move to last line
            - <kbd>n</kbd> <kbd>G</kbd> : move to nth line of file (n is a number; 12G moves to line 12)
            - <kbd>H</kbd> : move to top of screen
            - <kbd>M</kbd> : move to middle of screen
            - <kbd>L</kbd> : move to bottom of screen
            - <kbd>z</kbd> <kbd>z</kbd> : scroll the line with the cursor to the center of the screen
            - <kbd>z</kbd> <kbd>.</kbd> : scroll the line with the cursor to the center of the screen and also moves
            the cursor to the first non-whitespace character in the line
            - <kbd>z</kbd> <kbd>t</kbd> :
            scroll the line with the cursor to the top
            - <kbd>z</kbd> <kbd>b</kbd> :
            scroll the line with the cursor to the bottom
            - <kbd>n</kbd> : next matching search pattern
            - <kbd>N</kbd> : previous matching search pattern
            - <kbd>*</kbd> : next whole word under cursor
            - <kbd>#</kbd> : previous whole word under cursor
            - <kbd>g</kbd> <kbd>*</kbd> :
            next matching search (not whole word) pattern under cursor
            - <kbd>g</kbd> <kbd>#</kbd> : previous matching search (not whole word) pattern under cursor
            - <kbd>%</kbd> : jump to matching bracket
            - <kbd>f</kbd> <kbd>X</kbd> : to next 'X' after cursor, in the same line (X is any character) (find)
            - <kbd>F</kbd> <kbd>X</kbd> :
            to previous 'X' before cursor (f and F put the cursor on X)
            - <kbd>t</kbd> <kbd>X</kbd> : til next 'X' (similar to above, but cursor is before X)
            - <kbd>T</kbd> <kbd>X</kbd> : til previous 'X'
            - <kbd>;</kbd> : repeat above, in same direction
            - <kbd>,</kbd> : repeat above, in reverse direction
    - Inserting text
        - <kbd>i</kbd> : insert at current location
        - <kbd>a</kbd> : insert after current location (append)
        - <kbd>I</kbd> : insert at start of current line
        - <kbd>A</kbd> : insert after end of current line
        - <kbd>o</kbd> : insert line below current line (open)
        - <kbd>O</kbd> : insert line above current line
        - <kbd>s</kbd> : delete character under cursor and start inserting in its place (substitute text)
        - <kbd>S</kbd> : delete all text on line and start inserting in its place (substitute line)
        - <kbd>c</kbd> <kbd>motion</kbd> : delete text corresponding to motion and start inserting (change)
        - <kbd>c</kbd> <kbd>c</kbd> : same as S (change line)
        - <kbd>C</kbd> : delete from the cursor to the end of line and start inserting at the cursor position
    - Operations
        - <kbd>.</kbd> : repeat last command
        - <kbd>~</kbd> : switch case
        - Cutting and copying in normal mode
          To copy into a register, one can use
          <kbd>"</kbd> <kbd>k</kbd>
          immediately before one of the above commands
          to copy into the register
          *k*.
            - Cutting (delete) can be done using
            <kbd>c</kbd> <kbd>motion</kbd>
            *d* stands for delete in Vim,
            which in other editors is usually called cut
                - <kbd>D</kbd> deletes from the cursor to the end of line
                (equivalent to <kbd>d</kbd> <kbd>$</kbd>)
                - <kbd>d</kbd> <kbd>d</kbd>
                (or equivalently <kbd>d</kbd> <kbd>_</kbd>)
                can be inconvenient since it deletes the current line, including the newline character at the end of the line.
                It can therefore be better to use
                    - <kbd>S</kbd> <kbd>escape</kbd>
                    or equivalently
                    <kbd>c</kbd> <kbd>c</kbd> <kbd>escape</kbd>
                    - <kbd>^</kbd> <kbd>D</kbd> :
                    move to the first character on the line
                    and delete until the end of the line
                    - <kbd>d</kbd> <kbd>d</kbd> followed by <kbd>O</kbd>
                - <kbd>x</kbd> : delete character under the cursor
                - <kbd>X</kbd> : delete the character before the cursor
                - Examples
                    - <kbd>d</kbd> <kbd>i</kbd> <kbd>w</kbd> :
                    delete the current word (excluding surrounding whitespace)
                    - <kbd>d</kbd> <kbd>a</kbd> <kbd>w</kbd> :
                    delete the current word
                    (including leading or trailing whitespace)
                    - <kbd>d</kbd> <kbd>a</kbd> <kbd>b</kbd> :
                    delete around (including) braces
                    - <kbd>d</kbd> <kbd>a</kbd> <kbd>B</kbd> : 
                    delete around (including) brackets
                    - <kbd>d</kbd> <kbd>i</kbd> <kbd>b</kbd> :
                    delete in (excluding) braces
                    - <kbd>d</kbd> <kbd>i</kbd> <kbd>B</kbd> : 
                    delete in (excluding) brackets
                    - <kbd>x</kbd> <kbd>p</kbd> : 
                    transpose letter at cursor and after cursor
            - Copying (yank) can be done using y{motion}
              y stands for yank in Vim, which in other editors is usually called copy
                - <kbd>y</kbd> <kbd>y</kbd>
                (or equivalently <kbd>y</kbd> <kbd>_</kbd>)
                can be inconvenient since it yanks the current line,
                including the newline character at the end of the line.
                It can therefore be better to use
                    - <kbd>^</kbd> <kbd>Y</kbd> : 
                    move to the first character on the line
                    and yank until the end of the line
                - <kbd>Y</kbd> yanks the current line,
                including the newline character at the end of the line
                (equivalent to <kbd>y</kbd> <kbd>$</kbd>)
                - Examples
                    - <kbd>y</kbd> <kbd>i</kbd> <kbd>w</kbd> : 
                    yank the current word (excluding surrounding whitespace)
                    - <kbd>y</kbd> <kbd>a</kbd> <kbd>w</kbd> :
                    yank the current word
                    (including leading or trailing whitespace)
                    - <kbd>y</kbd> <kbd>a</kbd> <kbd>b</kbd> : 
                    yank around (including) braces
                    - <kbd>y</kbd> <kbd>a</kbd> <kbd>B</kbd> : 
                    yank around (including) brackets
                    - <kbd>y</kbd> <kbd>i</kbd> <kbd>b</kbd> : 
                    yank in (excluding) braces
                    - <kbd>y</kbd> <kbd>i</kbd> <kbd>B</kbd> : 
                    yank in (excluding) brackets
        - Pasting in normal mode
          To select a register from which to paste, one can use
          <kbd>"</kbd> <kbd>k</kbd> <kbd>p</kbd>
          to paste from the register
          *k*.
            - <kbd>p</kbd> : paste after cursor
            - <kbd>P</kbd> : paste before cursor
        - Pasting in insert mode
            - <kbd>control</kbd> + <kbd>r</kbd>
            then a character that identifies the register
            - Examples
                - <kbd>control</kbd> + <kbd>r</kbd> 
                then <kbd>"</kbd> pastes from the default register
                - <kbd>control</kbd> + <kbd>r</kbd> 
                then <kbd>0</kbd> pastes from register zero which holds the text that was most recently yanked (copied)
        - Marking text (visual mode)
            - <kbd>v</kbd> : start visual mode. Marks the current character.
            - <kbd>V</kbd> : start line-wise visual mode. Marks the current line.
            - <kbd>control</kbd> + <kbd>V</kbd> : 
            start visual block mode
            - Visual mode commands
                - <kbd>o</kbd> : move to other end of marked area
                - <kbd>O</kbd> : move to the other corner of the current block
                - <kbd>i</kbd> <kbd>w</kbd> :
                mark the current word and places the cursor
                on the last character of the word
                - <kbd>a</kbd> <kbd>w</kbd> : 
                mark the current word and places
                the cursor on the whitespace after the word
                - <kbd>a</kbd> <kbd>b</kbd> :
                mark around (including) braces
                - <kbd>a</kbd> <kbd>B</kbd> : 
                mark around (including) brackets
                - <kbd>i</kbd> <kbd>b</kbd> : 
                mark in (excluding) braces
                - <kbd>i</kbd> <kbd>B</kbd> : 
                mark in (excluding) brackets
                - <kbd>escape</kbd> : exit visual mode
    - Registers
        - To access a register, 
        you type <kbd>"</kbd> <kbd>k</kbd> before a command,
        where *k* is the name of a register.
        - If you want to copy the current line into register *k*,
        you can type
        <kbd>"</kbd> + <kbd>k</kbd> + <kbd>y</kbd> + <kbd>y</kbd>,
        or you can append to a register by using a capital letter
        <kbd>"</kbd> + <kbd>K</kbd> + <kbd>y</kbd> + <kbd>y</kbd>.
        - If you yank text without assigning it to a particular register,
        then it will be assigned to the *0* register,
        as well as being saved in the default *"* register.
        The difference between the *0* and *"* registers
        is that *0* is only populated with yanked text,
        whereas the default register is also populated with text deleted using
        <kbd>d</kbd> / <kbd>D</kbd> /
        <kbd>x</kbd> / <kbd>X</kbd> /
        <kbd>c</kbd>/<kbd>C</kbd> /
        <kbd>s</kbd> / <kbd>S</kbd> commands.
        - <kbd>p</kbd> or <kbd>P</kbd>
        pastes from the default register.
        The longhand equivalent would be
        <kbd>"</kbd> <kbd>"</kbd> <kbd>p</kbd>
        (or <kbd>"</kbd> <kbd>"</kbd> <kbd>P</kbd>).
        - The same way <kbd>"</kbd> <kbd>0</kbd> holds the last yank,
        <kbd>"</kbd> <kbd>1</kbd> holds the last delete or change.
- iTerm2
    - <kbd>command</kbd> + <kbd>shift</kbd> + <kbd>d</kbd> :
    split horizontally
    - <kbd>command</kbd> + <kbd>d</kbd> :
    split vertically
    - <kbd>command</kbd> + <kbd>[</kbd>
    and <kbd>command</kbd> + <kbd>]</kbd> :
    cycle through panes
    - If in 2D, <kbd>command</kbd> + <kbd>alt</kbd> + <kbd>arrow key</kbd>
    to change pane
- Tmux
    - Prefix changed from the default <kbd>control</kbd> + <kbd>b</kbd>
    to <kbd>control</kbd> + <kbd>a</kbd> in `~/.tmux.conf`.
    - <kbd>control</kbd> + <kbd>a</kbd> <kbd>?</kbd> :
    enter Help Mode and display a list of keyboard shortcuts
    (<kbd>return</kbd> to exit)
    - <kbd>control</kbd> + <kbd>a</kbd> <kbd>[</kbd> :
    enter Copy Mode which enables the use of movement keys
    to move the cursor around the screen (<kbd>return</kbd> to exit)
    - <kbd>control</kbd> + <kbd>a</kbd> <kbd>I</kbd> :
    fetch the plugins and source them
    - <kbd>meta</kbd> + *select text with left mouse* :
    copy selected text to clipboard
    - Managing sessions
        - `tmux ls` list out the running sessions
        - `tmux new-session -s work` create a session named 'work'
        - `tmux new-session -s work2 -t work` create a new session that shares all windows with an existing session, but has its own separate notion of which window is current
        - `tmux kill-session -t work` kill the the session named 'work'
        - `tmux attach -t work` attach to a session
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>d</kbd> :
        detach from a session
        - Switch between sessions
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>(</kbd> :
            switch to previous session
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>)</kbd> :
            switch to next session
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>L</kbd> :
            switch to *last* (previously used) session
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>s</kbd> :
            choose a session from a list
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>$</kbd> :
        rename the current session
    - Managing windows
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>c</kbd> :
        create a new window
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>w</kbd> :
        list out the running windows
        - Switch between windows
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd><1,...,9,0></kbd> ::
            switch to window with number in {1,...,9,0}
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>p</kbd> :
            switch to previous window
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>n</kbd> :
            switch to next window
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>l</kbd> :
            switch to *last* (previously used) window
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>w</kbd> :
            choose window from a list
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>,</kbd> :
        rename the current window
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>&</kbd> :
        kill the current window
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>.</kbd> :
        renumber current window
        - <kbd>control</kbd> + <kbd>a</kbd>
        `swap-window -s <source_window> -t <target_window>` :
        swap windows
    - Managing split panes
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>x</kbd> :
        kill the current pane
        - <kbd>control</kbd> + <kbd>a</kbd> <kbd>q</kbd> :
        display pane numbers for a short while
        - Creating a new pane by splitting an existing one
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>"</kbd> :
            split vertically (top/bottom)
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>%</kbd> :
            split horizontally (left/right)
        - Switching between panes
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>arrow key</kbd> :
            go to the next panel in the direction
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>o</kbd> :
            switch to the next pane (cycle through all of them)
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>;</kbd> :
            switch to the *last* (previously used) pane
        - Moving panes aroud
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>{</kbd> :
            move the current pane to the previous position
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>}</kbd> :
            move the current pane to the next position-
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>control</kbd> + <kbd>o</kbd> :
            rotate window 'up' (i.e. move all panes)
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>o</kbd> :
            rotate window 'down'
        - Applying predefined layouts
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>1</kbd> :
            switch to even-horizontal layout
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>2</kbd> :
            switch to even-vertical layout
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>3</kbd> :
            switch to main-horizontal layout
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>4</kbd> :
            switch to main-vertical layout
            - <kbd>control</kbd> + <kbd>a</kbd>
            <kbd>meta</kbd> + <kbd>5</kbd> :
            switch to tiled layout
            - <kbd>control</kbd> + <kbd>a</kbd> <kbd>space</kbd> :
            switch to the next layout
- Git
    - Coding style conventions
        - Repositories
            - Repositories' names should
                - be *lowercase*
                - use *hyphens* to separate words
                (appears in URL, never use camelCase, PascalCase, etc.)
                - end in `.git` if and only if it was `init` with the `--bare` flag
        - Branches
            - Choose *short* and *descriptive* names
            - When working on fixing a ticket in an external service (e.g. GH issue), work on a branch named after the ticket: `git checkout -b issue-15`
            - Use *hyphens* to separate words
            - When several people are working on the *same* feature, it might be convenient to have *personal* feature branches and a *team-wide* feature branch. The personal branches should be merged with the team-wide branch, and the team-wide branch will eventually be merged to "master"
                - `git checkout -b feature-a/master` team-wide branch
                - `git checkout -b feature-a/maria` Maria's personal branch
                - `git checkout -b feature-a/nick` Nick's personal branch
            - Delete your branch from the upstream repository after it is merged, unless there is a specific reason not to
                - Tip: Use the following command while being on "master", to list merged branches: `git branch --merged | grep -v "\*"`
        - Commits
            - There should one commit for each *logical* change. Logical changes should be split and each committed individually
                - Tip: Use `git add -p` to interactively stage specific portions of the modified files
            - Do not split a single logical change into several commits
            - Commit *early* and *often*. Small, self-contained commits are easier to understand and revert when something goes wrong
        - Messages
            - Commit messages should
                - *be descriptive* yet *succinct*
                - start with a *capital* letter
                - be written in *imperative* tense (not preterit)
            - Use the SHA1 when referring to commits in a commit message
        - Merge
            - If your branch includes more than one commit, do not merge with a fast-forward
            - Do not rewrite published history. The repository's history is valuable in its own right and it is very important to be able to tell what actually happened. Altering published history is a common source of problems for anyone working on the project.
            - Before merging, rebase it onto the branch it's going to be merged to, in order to maintain a linear history.
                - If we merge with "master": `git fetch; git rebase origin//master;`
    - Set name and email address
        - For the current repository: `--local`
            - `git config --local user.name "Your Name Here"`
            - `git config --local user.email your@email.com`
        - To override the default name and address defined in `~/.gitconfig`: `--global`
            - `git config --global user.name "Your Name Here"`
            - `git config --global user.email your@email.com`
    - Usual commands
        - `echo "# Repo's name" >> README.md`
        - `git init`
        - `git add <filename>`
        - `git add -A` to stage all the updated/added/deleted files
        - `git commit -m "commit message"`
          or `git commit -am "commit message"` to add everything unstaged and commit at once
        - `git remote add origin git@github.com:...`
          Always use SSH, not HTTPS
        - `git remote -v`
        - `git push -u origin master` push master branch to "origin" remote and sets up tracking
          the `-u`(upstream) is only necessary for the very first push, then git remembers
    - `git commit -am "commit message"` Providing the -a option to the git commit command makes Git automatically stage every file that is already tracked before doing the commit
    - `git add -u` Only match against already tracked files in the index rather than the working tree. That means that it will never stage new files, but that it will stage modified new contents of tracked files and that it will remove files from the index if the corresponding files in the working tree have been removed. If no arg is given, default to `.`; in other words, **update** all tracked files in the current directory and its subdirectories.
    - `git rm <filename>` Remove file from both filesystem and Git repository
    - `git rm --cached <filename>` Remove file only from the Git repository. The file will remain in the filesystem
    - Bitbucket and Github both for one project
        - `git remote rename origin github` rename remote if the current project points to github
        - `git remote add bitbucket git@bitbucket.org:...` add another remote repository, e.g. bitbucket
        - `git push -u github <branch_name>` / `git push -u bitbucket <branch_name>`
          after first push in each, no need for -u anymore
        - `git pull github <branch_name>` / `git pull bitbucket <branch_name>`
    - Align w/ the remote branch after a non fast-forward merge
        - `git fetch` to fetch the remote branch to local
        - `git ls5` (alias) find the commit to align with
        - `git checkout <commit_id>` move to the branch where the commit is
        - `git branch -D master` delete the master branch (need `-D` for this)
        - `git branch master` create a new branch named "master"
        - `git checkout master` switch to newly created master branch
        - `git branch`, `git ls5` (alias) verify that everything went well
    - Force pull
        - `git fetch --all`
        - `git reset --hard origin/master`
- Editor tokens
    - `TODO` informal tasks/features that are pending completion
    - `NOTE` sections where a code reviewer found something that needs discussion or further investigation
    - `HACK` temporary code to force inflexible functionality, or simply a test change, or workaround a known problem
    - `XXX` flag something that is bogus but works
    - `FIXME` flag something that is bogus and broken
- Generate a new SSH key for password-less authentication
    - `ssh-keygen -f ~/.ssh/baobab_key_ecdsa -t ecdsa -b 521` create an ssh key pair for user authentication
        - The name of the file in which the key is stored is selected using the `-f` option
        - The algorithm is selected using the `-t` option and key size using the `-b` option
    - `ssh-copy-id -i ~/.ssh/baobab_key_ecdsa blonde0@baobab.unige.ch` copy the **public** key to the server
    - `ssh -i ~/.ssh/baobab_key_ecdsa blonde0@baobab.unige.ch` connect to the server (without any password prompt)
        - The identity file (file from which the identity key (private key) for public key authentication is read) is specified via the `-i` option
        - It can then be alias-ed under an shorter name
