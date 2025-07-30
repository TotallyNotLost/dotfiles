# Installation
Use GNU stow to install packages.

E.g.

```sh
stow -t ~ package1 [package2]
```

Recommended packages are:

```sh
stow -t ~ backgrounds bash bat git hypr kitty nvim starship-local tmux teamocil television waybar wofi
```

Create a hyprland-local.conf and store any local settings there.
This is a good place for monitor settings.
```sh
touch ~/.config/hypr/hyprland-local.conf
```

Pacman:
```sh
sudo pacman -S bat btop git-delta hypridle hyprlock kitty lsd neovim starship swayosd-git swww television ueberzugpp yazi zoxide
```

Yay:
```sh
yay -S matugen-bin python-pywalfox
```

Installing bat theme:
```
mkdir -p ~/.config/bat/themes
git clone https://github.com/kristoferfannar/onedark-bat.git ~/.config/bat/themes/onedark-bat
bat cache --build
```

# Configuration

`touch ~/.config/nvim/lua/settings-local.lua`
