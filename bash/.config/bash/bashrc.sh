export TERM=xterm-256color
export EDITOR=nvim

# Starship
eval "$(starship init bash)"

# Television
echo 'eval "$(tv init bash)"' >> ~/.bashrc

# Local config
if [ -f ~/.config/bash/bashrc-local.sh ]; then
    source ~/.config/bash/bashrc-local.sh
fi

# Golang
if [ -f /usr/local/go/bin/go ]; then
    PATH=$PATH:/usr/local/go/bin
fi
if command -v go 2>&1 >/dev/null; then
    go env -w GOPATH=$HOME/.go
    PATH=$PATH:$HOME/.go/bin
fi

# Zoxide
eval "$(zoxide init bash --cmd cd)"
