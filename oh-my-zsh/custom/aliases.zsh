# "cat"
# sudo easy_install Pygments
alias ccat='pygmentize -O style=native -f console256 -g'

# cd
alias ..='cd ..'

# ls
alias ls='ls -F'
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -A'

# git
alias gl='git pull'
alias glr='git pull --rebase'
alias glff='git pull --ff-only'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gs='git status'
alias glog="git log --graph --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %an' --abbrev-commit --date=relative"
alias tower='gittower'

# rails
alias migrate='rake db:migrate'
alias r='rails'

# Serve the current directory
alias servethis='python -m http.server'

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
alias netlisteners='lsof -i -P | grep LISTEN'

# Hexadecimal randomness
alias rand='openssl rand -hex'

# Combine PDFs
alias joinpdfs='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# https://www.ipify.org/
# Silly complicated just to get a newline at the end of the output...
alias ip='function ipify() { echo $(curl -s https://api.ipify.org) }; ipify'
