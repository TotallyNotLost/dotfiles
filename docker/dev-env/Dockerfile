ARG IMAGE=debian
ARG TYPE=coding

FROM $IMAGE AS base

ENV TERM=xterm-256color

RUN apt update && apt upgrade -y
RUN apt install -y bash curl dpkg-dev git highlight locales lsd ripgrep ruby stow tmux yazi
RUN curl -sS https://starship.rs/install.sh  | sh -s -- -y

# Set locale to en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
RUN locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Setup grc
RUN git clone --depth 1 https://github.com/garabik/grc /tmp/grc
WORKDIR /tmp/grc
RUN ./install.sh

# Install nvim
WORKDIR /tmp/nvim
RUN apt install -y cmake file gettext ninja-build unzip
RUN git clone --depth 1 https://github.com/neovim/neovim
WORKDIR neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
WORKDIR build
RUN cpack -G DEB
RUN dpkg -i nvim-linux-x86_64.deb

RUN gem install teamocil

#
# User configuration
#

ARG USER=appuser
ARG GROUP=appgroup
RUN addgroup $GROUP && adduser --ingroup $GROUP --shell /bin/bash $USER

USER ${USER}

WORKDIR /home/${USER}

RUN mkdir -p .code/github.com/TotallyNotLost

WORKDIR .code/github.com/TotallyNotLost

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
RUN git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git clone --depth 1 https://github.com/TotallyNotLost/dotfiles

WORKDIR dotfiles

# Stow packages that require extra setup.
# Do this before the other packages so that
# these slow layers of the image don't need
# to be re-run with changes to unrelated plugins.
RUN stow -t ~ nvim teamocil tmux

RUN nvim --headless "+Lazy! sync" +qall
RUN ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Stow packages that require no extra setup.
RUN rm ~/.bashrc
RUN stow -t ~ bash starship-docker

WORKDIR /home/${USER}

RUN echo "PATH=/go/bin:/usr/local/go/bin:\$PATH:\$(gem environment path | awk '{split(\$0, a, \":\"); print a[1]}')/bin" >> .bashrc
RUN echo "source ~/.bashrc" >> ~/.bash_profile

##########
# Coding #
##########
FROM base AS branch-coding

ARG LSP_SERVER
RUN nvim --headless +"MasonInstall $LSP_SERVER" +qall

ARG GIT_KEYS_DIR
COPY $GIT_KEYS_DIR /home/${USER}/.ssh
USER root
RUN chmod 700 /home/${USER}/.ssh
RUN chown -R ${USER}:${GROUP} /home/${USER}/.ssh
USER ${USER}

ARG GIT_REPO
RUN git clone --depth 1 $GIT_REPO workspace

WORKDIR workspace

##########
# Golang #
##########
FROM branch-coding AS branch-coding-golang

RUN go install github.com/mitranim/gow@latest

#############
# Writing #
#############
FROM base AS branch-writing

USER root

RUN apt install -y pandoc pipx

USER ${USER}
WORKDIR /home/${USER}/workspace

RUN pipx install epy-reader
RUN pipx ensurepath

#########
# Final #
#########
FROM branch-$TYPE AS final

ARG TEAMOCIL_LAYOUT
ENV APP_TEAMOCIL_LAYOUT=${TEAMOCIL_LAYOUT}

CMD ["/bin/sh", "-c", "tmux new-session /usr/local/bin/teamocil ${APP_TEAMOCIL_LAYOUT}"]
