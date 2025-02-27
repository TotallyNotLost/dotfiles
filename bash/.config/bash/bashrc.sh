export EDITOR=nvim

# Init Starship
eval "$(starship init bash)"

# Init FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
