# Cheat Sheet

## Vim

### Motions
- Motions that can be preceded by a count
    - `h`: move one character left
    - `j`: move one row down
    - `k`: move one row up
    - `l`: move one character right
    - `w`: move to beginning of next word
    - `b`: move to previous beginning of word
    - `e`: move to end of next word
    - `ge`: move to previous end of word
    - `W`: move to beginning of next word after a whitespace
    - `B`: move to beginning of previous word before a whitespace
    - `E`: move to end of word before a whitespace
    - *Note: using the capital letters (W B E) is very often what I want to use as opposed to the non-cap variants*
- Motions that are used alone
    - `0`: (zero) move to beginning of line
    - `$`: move to end of line
    - `^`: move to first non-blank character of the line
    - `gg`: move to first line
    - `G`: move to last line
    - `nG` or `:n`: move to nth line of file; **prefer the command `:n` as we then see the number on screen**
    - `H`: move to top of screen
    - `M`: move to middle of screen
    - `L`: move to bottom of screen
    - `zz`: scroll the line with the cursor to the center of the screen (in German: Zentrum, hence the "z")
    - `z.`: scroll the line with the cursor to the center of the screen
      and also moves the cursor to the first non-whitespace character in the line
    - `zt`: move the current line to the top of the view port
    - `zb`: move the current line to the bottom of the view port
    - `C-y`: move the viewport up one line (*yore* (long ago), or, yesterday)
    - `C-e`: move the viewport down one line (*efter* means "after" in Swedish)
    - `C-d` and `C-f`: move the view port down/forward half/one page
      Forward has more character than down, so the movement takes further
    - `C-u` and `C-b`: move the viewport up/backward half/one page
      Backward has more characters than up, so the movement takes further
    - `zt`: scroll the line with the cursor to the top
    - `zb`: scroll the line with the cursor to the bottom
    - `n`: next matching search pattern
    - `N`: previous matching search pattern
    - `*`: next whole word under cursor
    - `#`: previous whole word under cursor
    - `g*`: next matching search (not whole word) pattern under cursor
    - `g#`: previous matching search (not whole word) pattern under cursor
    - `cgn`: change the next search pattern (follow with `.` to quickly do the same replace op)
    - `%`: jump to matching bracket
    - `f<CHAR>`: find next character `<CHAR>` after cursor, in the same line
    - `F<CHAR>`: find previous character `<CHAR>` before cursor, same line
    - *Note: `f` and `F` put the cursor **on** character `<CHAR>`*
    - `t<CHAR>`: til next character `<CHAR>`
    - `T<CHAR>`: til previous character `<CHAR>`
    - *Note: `t` and `T` put the cursor **before** character `<CHAR>`*
    - `;`: repeat above, in same direction (it is a repeat, but a repeat of a motion)
    - `,`: repeat above, in reverse direction (same as above in the parentheses)

### Inserting text
- `i`: insert at current location
- `a`: insert after current location (append)
- `I`: insert at start of current line
- `A`: insert after end of current line
- `o`: insert line below current line (open)
- `O`: insert line above current line
- `s`: delete character under cursor and start inserting in its place (substitute text)
- `S`: delete all text on line and start inserting in its place (substitute line)
- `c<MOTION>`: delete text corresponding to `<MOTION>` and start inserting (change)
- `cc`: same as S (change line)
- `C`: delete from the cursor to the end of line and start inserting at the cursor position

### Operations

#### Ops on commands (repeats and undos)
- `.`: repeat last command
- (Remember that in the "Motions" subsection, we described `;` and `,` which do operate repeats or previous motions)
- `u` and `U`: undo, and undo all the changes made in the current line
- Will be repeated later in the "Editor" section: `:changes` displays the changelist (in a pager view)
- The two following commands move the cursor at positions where changes happened as tracked by the changelist:
    - `g;`: go to the last position of the cursor where something has been edited
    - `g,`: the opposite the above, i.e. go to the next position where something has been edited

#### Pasting in normal mode
- To select a register from which to paste, one can use `"kp`
to paste from the register *k*.
- `p`: paste after cursor
- `P`: paste before cursor

#### Pasting in insert mode
- `CTRL-r` then a character that identifies the register
- Examples
    - `CTRL-r`, then `"` pastes from the default register
    - `CTRL-r`, then `0` pastes from register zero
    which holds the text that was most recently yanked

#### Marking text (visual mode)
- `v`: start visual mode. Marks the current character.
- `V`: start line-wise visual mode. Marks the current line.
- `gv`: re-select previous selection
- `CTRL-v`: start visual block mode
- Visual mode commands
    - `o`: move to other end of marked area
    - `O`: move to the other corner of the current block
    - `iw`: mark the current word and places the cursor on the last character of the word
    - `aw`: mark the current word and places the cursor on the whitespace after the word
    - `ab`: mark around (including) braces
    - `aB`: mark around (including) brackets
    - `ib`: mark in (excluding) braces
    - `iB`: mark in (excluding) brackets
    - `<ESC>`: exit visual mode

### Registers
- To access a register, you type `"k` before a command, where *k* is the name of a register.
- If you want to copy the current line into register *k*, you can type
`"` + `k` + `y` + `y`,
or you can append to a register by using a capital letter
`"` + `K` + `y` + `y`.
- If you yank text without assigning it to a particular register, then it will be assigned to the *0* register,
as well as being saved in the default *"* register. The difference between the *0* and *"* registers
is that *0* is only populated with yanked text, whereas the default register is also populated with text
deleted or changed using
`d`, `D`, `x`, `X`, `c`, `C`, `s`, `S` commands.
- `p` or `P` pastes from the default register. The longhand equivalent would be
`""p` (or `""P`).
- The same way `"0` holds the last yank, `"1` holds the last delete or change.
- **Use `"*` to yank and paste characters and lines (segments) to and from the PRIMARY clipboard**.

### Editor
- `:`, then `CTRL-p`: previous command in history of executed commands
- `:`, then `CTRL-n`: next command in history of executed commands
- Hitting `<TAB>` while in the `:` menu shows all the options for the currently typed entry
- `CTRL-w`, then a direction in `<H|J|K|L>`: move to the next pane in that direction
- `:e`: open file (will create what Vim calls a *buffer* with that file in it)
- `:bn`: jump to the next buffer
- `:bp`: jump to the previous buffer
- `:bd`: unload buffer (default: current buffer) and delete it from the buffer list
- `:b` + `blabla`: jump to the first next buffer in the list that contains the substring `blablab`
- `:Ex`: open a file on a new full-window buffer
- `:Vex`: open a file in a new buffer placed in a new vertical pane of the same window by splitting it
- `:Hex`: open a file in a new buffer placed in a new horizontal pane of the same window by splitting it
- `:changes`: display the content of the changelist (quit the list with the standard `q`, it opens a pager)

### Plugins

#### Vim Markdown
- Table of contents/outline
    - `:Toc` or `:Tocv`: add a vertical pane than shows the outline of the open Markdown file
    - `:Toch`: add a horizontal pane than shows the outline of the open Markdown file
- Links
    - `gx`: open the link under the cursor in the default browser
- Folding
    - `za`: toggle opening/closing the current fold
    - `zA`: recursively toggle opening/closing the current fold
    - `zo`: open current fold
    - `zO`: recursively open current fold
    - `zc`: close current fold
    - `zC`: recursively close current fold
    - `zr`: increase the folding level by one
    - `zR`: open all folds
    - `zm`: decrease the folding level by one
    - `zM`: close all folds
- Navigating headers
    - `]]`: go to the next header
    - `[[`: go to previous header
    - `][`: go to next sibling header (if any)
    - `[]`: go to previous sibling header (if any)
    - `]h`: go to current header ('h' for *Header*)
    - `]u`: go to parent header ('u' for *Up*)

#### Surround
- `Surround.vim` is all about "surroundings": parentheses, brackets, quotes, XML tags, and more
- The plugin provides mappings to easily *delete, change and add such surroundings in pairs*
- Press `cs"'` (read *Change Surroundings from " to '*) inside `"Hello world!"` to change it to `'Hello world!'`
- Now, press `cs'<q>` to change `'Hello world!'` to `<q>Hello world!</q>` (note how the closing tag has the `/`)
- To go back from where we started, press `cst"` (read *Change Surrounding Tag to "*) to get `"Hello world!"`
- To **remove** the delimiters entirely, press `ds"`: `Hello world!`
- With the cursor on `Hello`, press `ysiw]` to add surrounding brackets immediately (no padding space) around the word
  `Hello` which was caught by the use of `iw`, the motion that captures the entirety of a word: `[Hello] world!`
- Let's transform these brackets into *braces*; this is done with `cs]}`, which yields `{Hello} world!`
- The surround-wrapping operation works with everything we might want to surround an expression with:
    - parentheses (`)` or `b`), braces (`}` or `B`), brackets (`]`), chevrons (`>`), underscores, pounds, asterisks
    - using the *left counterpart* of these symbols **pads** what we surround with **spaces** before surrounding
    - N.B.: the space-padding counterpart operation does not work with chevrons: `<` is reserved for *tag surrounds*
    - As such pressing `cs}(` or equivalently `csB(` (on `{Hello} world!`) gives `( Hello ) world!`
- The use of `s` after the first two letters makes the operation wrap the entire line
    - To wrap the entire line `{ Hello } world!` in parentheses, use `yssb` or `yss)`: `({ Hello } world!)`
    - Using the left counterpart parenthesis with `yss(` pads with a space here too: `( { Hello } world! )`
    - To get rid of every wrapping symbol, one can use `ds)` or `dsb` to remove *just* the parentheses
    - Using `ds(` will remove *both the parentheses **and** the padding spaces*; this is particularly convenient
- To wrap with matching opening/closing tags, use `ysiw<em>` to emphasize the word as such: `<em>Hello</em> world!`
- Finally, let's consider **visual mode**: press capital `V` (for linewise visual mode) or select with `v`, followed by
    - `S}` to wrap the selected text (with `v` or `V`) with braces; `SB` (same as `S}`) and `S{` (space padding) work
    - `S<p class="important">` surrounds the selection above and below (new lines) with matching tags with options:
      ```xml
      <p class="important">
        <em>Hello</em> world!
      </p>
      ```
    - This plugin is very powerful for HTML and XML *editing*, a niche which currently seems underfilled in Vim land
    - As opposed to HTML/XML *inserting*, for which many plugins are available
    - With `surround.vim`, adding, changing, and removing pairs of tags simultaneously is a breeze!

#### Unimpaired
- `[<SPC>` and `]<SPC>`: add newline(s) before the cursor line (accept a *count*: can thus add more than one newline)

### Reformatting, Hard-Wrapping
- `gq<MOTION>`: hard-wrap the text that the *<MOTION>* covers
- Examples
    - `gqip`: hard-wrap the current paragraph
    - `gqq`: hard-wrap the current line
    - `gq2j`: hard-wrap the 3 next line including the current one
    - Another option is to select the lines in visual mode first, then hit `gq`
- `=`: apply proper formatting to the selection (need be in visual mode)
- `==`: apply proper formatting to the current line
- `=ip`: apply proper formatting to the paragraph
- `gg=G`: apply proper formatting to the whole file
- `~`: switch the current selection (in visual mode) or character (in normal mode) between lowercase and uppercase
- `U` and `u`: like above, but `U` makes uppercase, while `u` makes lowercase
- `>>`: indent
- `<<`: de-indent

## Things 3

### Create new items
- `CMD-n`: create a new to-do
- `<SPC>`: create a new to-do below selection
- `CMD-v`: paste plain text to create new to-dos
- `CMD-SHIFT-c`: create a checklist in an open to-do
- `CMD-SHIFT-n`: create a new heading in a project
- `CMD-META-c`: create a new project
- `CTRL-<SPC>`: open Quick Entry
- `CTRL-META-<SPC>`: open Quick Entry with Autofill

### Edit items
- `<CR>`: open a to-do or project
- `CMD-<CR>`: save and close
- `<ESC>`: save and close (careful, closes Quick Entry)
- `CMD-d`: duplicate a to-do or project
- `CMD-c`: copy a to-do or project
- `CMD-v`: paste a to-do or project
- `CMD-k`: complete selected items
- `CMD-META-.`: cancel selected items
- `CMD-<BS>` or `delete`: delete selected items
- `CMD-l`: move completed to Logbook

### Select items
- `<UP>`: select item above
- `<DOWN>`: select item below
- `SHIFT-<UP>`: extend selection upwards
- `SHIFT-<DOWN>`: extend selection downwards
- `SHIFT-META-<UP>`: extend selection to the top
- `SHIFT-META-<DOWN>`: extend selection to the bottom
- `CMD-a`: select everything

### Move items
- `CMD-SHIFT-m`: move selection to another list
- `CMD-META-v`: move copied to-dos and projects
- `CMD-<UP>`: move selection up
- `CMD-<DOWN>`: move selection down
- `CMD-META-<UP>`: move selection to top of list
- `CMD-META-<DOWN>`: move selection to bottom of list

### Edit dates
- `CMD-s`: show When
- `CMD-t`: start Today
- `CMD-e`: start This Evening
- `CMD-r`: start Anytime
- `CMD-o`: start Someday
- `CTRL-]`: start date +1 day
- `CTRL-[`: start date -1 day
- `CTRL-SHIFT-]`: start date +1 week
- `CTRL-SHIFT-[`: start date -1 week
- `CMD-SHIFT-d`: add a deadline
- `CTRL-.`: deadline +1 day
- `CTRL-,`: deadline -1 day
- `CTRL-SHIFT-.`: deadline +1 week
- `CTRL-SHIFT-,`: deadline -1 week
- `CMD-SHIFT-r`: make to-do or project repeating

### Control windows
- `CTRL-CMD-n`: open new window
- `CMD-/`: hide or show sidebar
- `CMD-META-t`: hide or show toolbar

### Navigate
- `CMD-1`: go to Inbox
- `CMD-2`: go to Today
- `CMD-3`: go to Upcoming
- `CMD-4`: go to Anytime
- `CMD-5`: go to Someday
- `CMD-6`: go to Logbook

### Search
- `any key`: start typing to begin a search
- `CMD-f`: find
- Keywords in search
    - `Tomorrow`: Quick Find list for tomorrow's to-dos (hehehe)
    - `Dealines`: Quick Find list for all deadlines
    - `Repeating`: Quick Find list for repeating to-dos
    - `Projects`: Quick Find list for all projects
    - `Logged Projects`: Quick Find list for completed projects
- Tag
    - `CTRL-CMD` + `t`: open tag window
    - `CMD-SHIFT-t`: access tag picker for selected to-dos

## Safari
- `CMD-SHIFT-r`: open Reader

## Sublime Text 3
- `CMD-d`: add next identical item to selection
- `CTRL-CMD-g`: select all the occurrences of the item
- `CTRL-SHIFT-<UP>` / `down`: multi-cursor
- `CMD-/`: toggle comment
- `CMD-]`: indent by one tab increment
- `CMD-[`:  de-indent by one tab increment
- `CMD-l`: select line (repeat to select the next one(s) too)
- `CMD-x`: delete line
- `CMD-<CR>`: insert new line after the current one
- `CMD-<LEFT CLICK>`: add extra cursor at clicked location
- `CTRL-CMD-<UP|DOWN>`: move line(s)
- `CMD-SHIFT-v`: paste with proper formatting
- `CMD-SHIFT-j`: join line below to the end of the current line
- `CMD-SHIFT-d`: duplicate line(s)
- `CMD-SHIFT-<CR>`: insert empty new line above the current line, and set cursor on that new line
- `CTRL-u`: soft undo
- `CTRL-g`: go to line in current file
- `CMD-META-<NUM OF COLS>`: set the number of columns in the layout

## macOS

### Misc
- Hold `META` while you *click on anything, especially menubar items*: show extra options and info
- Hold `META` while you *click on Notification Center icon in menu bar*: toggle *do not disturb*
- `CMD-SHIFT-META-v`: paste without formatting
- `CMD-[`: go to the previous page
- `CMD-]`: go to the next page
- `CTRL-CMD-q`: lock the screen
- `CMD-b` after typing something in Spotlight to web-search it
- `CMD-SHIFT-.`: show/hide hidden files
- `SHIFT` + *double left click on title bar*: maximize/demaximize
- `META-2`: trademark "TM" symbol in exponent
- `META-=`: "not equal" symbol

### Moving the cursor/Arrow keys
- `CTRL-b`: move backward one character
- `CTRL-f`: move forward one character
- `CTRL-p`: previous command (up arrow)
- `CTRL-n`: next command (down arrow)
- `CTRL-a`: go to the beginning of the line (Home)
- `CTRL-e`: go to the end of the line (End)

### Delete/Modify
- `CTRL-d`: delete character from left to right
- `CTRL-h`: delete character from right to left
- `META-<BS>`: delete word to the left
- `CMD-<BS>`: delete from cursor to beginning of line
- `CTRL-k`: delete from cursor to end of line
- `CTRL-o`: insert a new line after the cursor
- `CTRL-t`: transpose characters around cursor

## Tmux
- Prefix changed from the default `CTRL-b` to `CTRL-a` in `~/.tmux.conf`
- `CTRL-a ?`: enter Help Mode and display a list of keyboard shortcuts (`<CR>` to exit)
- `CTRL-a [`: enter Copy Mode which enables the use of movement keys to move the cursor around the screen (`<CR>` to exit)
- `CTRL-a I`: fetch the plugins and source them
- Hold `META` while you *select text with your left mouse button*: copy selected text to clipboard

### Managing sessions
- `tmux ls` list out the running sessions
- `tmux new-session -s work` create a session named 'work'
- `tmux new-session -s work2 -t work` create a new session that shares all windows with an existing session, but has its
  own separate notion of which window is current
- `tmux kill-session -t work` kill the the session named 'work'
- `tmux attach -t work` attach to a session
- `CTRL-ad`: detach from a session
- Switch between sessions
    - `CTRL-a (`: switch to previous session
    - `CTRL-a )`: switch to next session
    - `CTRL-a L`: switch to *last* (previously used) session
    - `CTRL-a s`: choose a session from a list
- `CTRL-a$`: rename the current session

### Managing windows
- `CTRL-a c`: create a new window
- `CTRL-a w`: list out the running windows
- Switch between windows
    - `CTRL-a <1|...|9|0>`: switch to window with number in {1,...,9,0}
    - `CTRL-a p`: switch to previous window
    - `CTRL-a n`: switch to next window
    - `CTRL-a l`: switch to *last* (previously used) window
    - `CTRL-a w`: choose window from a list
- `CTRL-a ,`: rename the current window
- `CTRL-a &`: kill the current window
- `CTRL-a .`: renumber current window
- `CTRL-a :swap-window -s <source_window> -t <target_window> <CR>`: swap windows

### Managing split panes
- `CTRL-a x`: kill the current pane
- `CTRL-a q`: display pane numbers for a short while
- Creating a new pane by splitting an existing one
    - `CTRL-a "`: split vertically (top/bottom)
    - `CTRL-a %`: split horizontally (left/right)
- Switching between panes
    - `CTRL-a <ARROW KEY>`: go to the next panel in the direction
    - `CTRL-a o`: switch to the next pane (cycle through all of them)
    - `CTRL-a;`:
    switch to the *last* (previously used) pane
- Moving panes aroud
    - `CTRL-a {`: move the current pane to the previous position
    - `CTRL-a }`: move the current pane to the next position-
    - `CTRL-a`
    `CTRL-o`: rotate window 'up' (i.e. move all panes)
    - `CTRL-a`
    `META-o`: rotate window 'down'
- Applying predefined layouts
    - `CTRL-a META-1`: switch to even-horizontal layout
    - `CTRL-a META-2`: switch to even-vertical layout
    - `CTRL-a META-3`: switch to main-horizontal layout
    - `CTRL-a META-4`: switch to main-vertical layout
    - `CTRL-a META-5`: switch to tiled layout
    - `CTRL-a <SPC>`: switch to the next layout

## Git

### Coding style conventions
- Repositories
    - Repositories' names should
        - be *lowercase*
        - use *hyphens* to separate words
          (appears in URL, never use camelCase, PascalCase, etc.)
        - end in `.git` if and only if it was `init` with the `--bare` flag
- Branches
    - Choose *short* and *descriptive* names
    - When working on fixing a ticket in an external service (e.g. GH issue),
    work on a branch named after the ticket: `git checkout -b issue-15`
    - Use *hyphens* to separate words
    - When several people are working on the *same* feature,
      it might be convenient to have *personal* feature branches and a *team-wide* feature branch.
      The personal branches should be merged with the team-wide branch,
      and the team-wide branch will eventually be merged to "master"
        - `git checkout -b feature-a/master` team-wide branch
        - `git checkout -b feature-a/maria` Maria's personal branch
        - `git checkout -b feature-a/nick` Nick's personal branch
    - Delete your branch from the upstream repository after it is merged, unless there is a specific reason not to
        - Tip: Use the following command while being on "master", to list merged branches:
        `git branch --merged | grep -v "\*"`
- Commits
    - There should one commit for each *logical* change
    - Tip: Use `git add -p` to interactively stage specific portions of the modified files
    - Do not split a single logical change into several commits
    - Commit *early* and *often*. Small, self-contained commits are easier to understand and revert
- Messages
    - Commit messages should
        - *be descriptive* yet *succinct*
        - start with a *capital* letter
        - be written in *imperative* tense (not preterit)
    - Use the SHA1 when referring to commits in a commit message
- Merge
    - If your branch includes more than one commit, do not merge with a fast-forward
    - Do not rewrite published history. The repository's history is valuable in its own right
    and it is very important to be able to tell what actually happened. Altering published history
    is a common source of problems for anyone working on the project.
    - Before merging, rebase it onto the branch it's going to be merged to, in order to maintain a linear history.
        - If we merge with "master": `git fetch; git rebase origin//master;`

### Set name and email address
- For the current repository: `--local`
    - `git config --local user.name "Your Name Here"`
    - `git config --local user.email your@email.com`
- To override the default name and address defined in `~/.gitconfig`: `--global`
    - `git config --global user.name "Your Name Here"`
    - `git config --global user.email your@email.com`

### Usual commands
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
- `git commit -am "commit message"` providing the `-a` option to the git commit command makes Git automatically
stage every file that is already tracked before doing the commit
- `git add -u` only match against already tracked files in the index rather than the working tree. That means that
it will never stage new files, but that it will stage modified new contents of tracked files
and that it will remove files from the index if the corresponding files in the working tree have been removed.
If no arg is given, default to `.`;
in other words, **update** all tracked files in the current directory and its subdirectories.
- `git rm <filename>` remove file from both filesystem and Git repository
- `git rm --cached <filename>` remove file only from the Git repository. The file will remain in the filesystem
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

## IINA
- `SHIFT-CMD-.`: jump to next chapter (`CMD-\>`)
- `SHIFT-CMD-,`: jump to next chapter (`CMD-\<`)

## Generate a new SSH key for password-less authentication
- `ssh-keygen -f ~/.ssh/bao -t rsa` create an ssh key pair for user authentication
    - The name of the file in which the key is stored is selected using the `-f` option
    - The algorithm is selected using the `-t` option and key size using the `-b` option
- `ssh-copy-id -i ~/.ssh/bao.pub blonde0@baobab.unige.ch` copy the **public** key to the server
- `ssh -i ~/.ssh/bao blonde0@baobab.unige.ch` connect to the server (without any password prompt)
    - The identity file (file from which the identity key (private key) for public key authentication is read)
    is specified via the `-i` option
    - It can then be alias-ed under an shorter name
