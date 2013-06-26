# brew
alias bu='brew update && brew upgrade'

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

# git mistype correction
alias got='git '
alias get='git '

# rails
alias migrate='rake db:migrate db:test:clone'
alias r='rails'
alias pss='passenger start -p 8080'

# Serve the current directory
alias servethis='python2.6 -m SimpleHTTPServer'

# commands starting with % for pasting from web
alias %=' '

# redcar
alias rc='redcar --fork'

# tree
alias tree='tree -C' # Turn colorization on always

# tab
alias t='tab' # Open a new tab in the same directory

# spotlight
alias sc='mdfind -onlyin . ' # Search in the current directory
alias meta='mdls' # Display file metadata (from Spotlight)

# Sublime Text 2
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

# Less useless listener grabbing on OS X
alias netlisteners="lsof -i -P | grep LISTEN"

# Kill coreaudio to fix AirPlay
alias fixairplay="sudo pkill coreaudiod"

# Hexadecimal randomness
alias rand="openssl rand -hex"
