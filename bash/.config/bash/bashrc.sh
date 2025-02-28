export EDITOR=nvim

# Init Starship
eval "$(starship init bash)"

# Init FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.config/bash/bashrc-local.sh ]; then
    source ~/.config/bash/bashrc-local.sh
fi

