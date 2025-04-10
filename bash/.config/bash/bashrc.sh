export TERM=xterm-256color
export EDITOR=nvim

# Starship
eval "$(starship init bash)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Local config
if [ -f ~/.config/bash/bashrc-local.sh ]; then
    source ~/.config/bash/bashrc-local.sh
fi

if command -v go 2>&1 >/dev/null; then
    PATH=$PATH:/usr/local/go/bin:$HOME/.go/bin
    go env -w GOPATH=$HOME/.go
fi
