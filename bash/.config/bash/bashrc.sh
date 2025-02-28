export EDITOR=nvim

# Starship
eval "$(starship init bash)"

# FZF
eval "$(fzf --bash)"

# Local config
if [ -f ~/.config/bash/bashrc-local.sh ]; then
    source ~/.config/bash/bashrc-local.sh
fi

