#!/usr/bin/env bash

WALLPAPER_DIR=~/.config/backgrounds/
SELECTED_WALL=$(hellpaper "$WALLPAPER_DIR")

# Exit if no wallpaper was selected (e.g., user pressed ESC)
if [ -z "$SELECTED_WALL" ]; then
    echo "No wallpaper selected."
    exit 1
fi

swww img --transition-type wipe "$SELECTED_WALL"
matugen image "$SELECTED_WALL"

# Reload btop
killall btop
foot --title btop btop

killall tclock
foot --title tclock tclock --color "$(cat ~/.config/tclock/tclock.color)"
