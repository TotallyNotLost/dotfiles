Use GNU stow to install packages.

E.g.

```sh
stow -t ~ package1 [package2]
```

# Arch

Create a hyprland-local.conf and store any local settings there.
This is a good place for monitor settings.
```sh
touch ~/.config/hypr/hyprland-local.conf
```

Install necessary packages with pacman.
```sh
sudo pacman -S brightnessctl btop fzf git-delta lsd neovim ranger ueberzugpp
```

Stow dot configs.
```sh
stow -t ~ backgrounds bash git hypr nvim starship-local tmux teamocil waybar wofi
```
