FROM debian

RUN apt-get update && apt-get upgrade

# Install nvim
WORKDIR /tmp/nvim
RUN apt-get install -y cmake file gettext git ninja-build unzip
RUN git clone https://github.com/neovim/neovim
WORKDIR neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
WORKDIR build
RUN cpack -G DEB
RUN dpkg -i nvim-linux-x86_64.deb

# Install additional packages
RUN apt-get install -y pandoc pipx
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

#
# User configuration
#

ARG USER=appuser
ARG GROUP=appgroup
RUN addgroup $GROUP && adduser --ingroup $GROUP --shell /bin/bash $USER

USER ${USER}
WORKDIR /home/${USER}/workspace

RUN pipx install epy-reader
RUN pipx ensurepath
RUN echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
RUN git clone https://github.com/MiragianCycle/OVIWrite.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

CMD ["/bin/bash"]
