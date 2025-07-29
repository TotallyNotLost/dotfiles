# Installation
Use GNU stow to install packages.

E.g.

```sh
stow -t ~ package1 [package2]
```

Recommended packages are:

```sh
stow -t ~ backgrounds bash git hypr nvim starship-local tmux teamocil waybar wofi
```

Create a hyprland-local.conf and store any local settings there.
This is a good place for monitor settings.
```sh
touch ~/.config/hypr/hyprland-local.conf
```

Pacman:
```sh
sudo pacman -S btop fzf git-delta hypridle hyprlock lsd neovim swayosd-git ueberzugpp yazi

Stow dot configs.
```sh
stow -t ~ backgrounds bash git hypr nvim starship-local tmux teamocil waybar wofi
```
