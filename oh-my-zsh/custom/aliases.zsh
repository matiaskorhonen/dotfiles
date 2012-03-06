# brew
alias bu='brew update && brew upgrade'

# cd
alias ..='cd ..'

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gx='gitx --all'

# git mistype correction
alias got='git '
alias get='git '

# rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias tlog='tail -f log/development.log'
alias scaffold='script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'
alias r='rails'
alias pss='passenger start -p 8080'

# Underpants
alias up='underpants'

# commands starting with % for pasting from web
alias %=' '

# sshuttle
alias britunnel='sshuttle -r britannia.kiskolabs.net 0.0.0.0/0'

# redcar
alias rc='redcar --fork'