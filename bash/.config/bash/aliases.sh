# General CLI
alias l='lsd --date relative'
alias ll='l -l'
alias la='ll -a'

# Git
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs='git status'

# Docker
alias dw='~/.config/bash/utils/docker-workspace-connect.sh'
alias dwc='~/.config/bash/utils/docker-workspace-create.sh'


#####################
# Language-specific #
#####################

# Golang
alias gowc='gow -g ~/.config/bash/utils/grcgo.sh'


####################
# Custom functions #
####################
notes() {
	grep -C 1 -ri $1 $2 | fold -w 80
}
