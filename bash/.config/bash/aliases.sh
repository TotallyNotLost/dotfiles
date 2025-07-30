# General CLI
alias l='lsd --date relative'
alias ll='l -l'
alias la='ll -a'

# Wallpaper
alias wallpaper='~/.config/bash/utils/wallpaper.sh'

# Nvim
alias v='nvim'
alias lazyvim='NVIM_APPNAME=lazyvim nvim'

# Git
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gp='git pull'
alias gpsh='git push'
alias gs='git status'
alias gsh='git stash'
alias gshp='git stash pop'

# Docker
alias dw='~/.config/bash/utils/docker-workspace-connect.sh'
alias dwc='~/.config/bash/utils/docker-workspace-create.sh'


#####################
# Language-specific #
#####################

# Golang
alias gowc='gow -g ~/.config/bash/utils/grcgo.sh'

# Writing
alias new-outline='cat ~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env/writing/outline.md >> outline.md'
