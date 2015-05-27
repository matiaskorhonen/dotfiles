# "cat"
# sudo easy_install Pygments
alias ccat='pygmentize -O style=native -f console256 -g'

# cd
alias ..='cd ..'

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# git
alias gl='git pull'
alias glr='git pull --rebase'
alias glff='git pull --ff-only'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gx='gitx --all'
alias glog="git log --graph --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %an' --abbrev-commit --date=relative"

# rails
alias migrate='rake db:migrate'
alias r='rails'

# Serve the current directory
alias servethis='python2.6 -m SimpleHTTPServer'

# commands starting with % for pasting from web
alias %=' '

# tree
alias tree='tree -C' # Turn colorization on always

# tab
alias t='tab' # Open a new tab in the same directory

# spotlight
alias sc='mdfind -onlyin . ' # Search in the current directory
alias meta='mdls' # Display file metadata (from Spotlight)

# Less useless listener grabbing on OS X
alias netlisteners="lsof -i -P | grep LISTEN"

# Hexadecimal randomness
alias rand="openssl rand -hex"

# Combine PDFs
alias joinpdfs="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"

# Get best quality video from iPlayer
alias iplayer="get_iplayer --modes=best --output=$HOME/Downloads"
