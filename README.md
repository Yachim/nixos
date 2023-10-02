# Yachim's NixOS config

## Create new machine
To create a new machine, follow steps:
 1. Create a file in `nixos/` named by a machine, specifiy machine-specific settings and YACHIM_CONFIG_DIR
 2. Copy `hardware-configuration.nix` to `nixos/` and import it in the machine-specific config

## Wallpaper and lockscreen
To set wallpaper, place an image named `wallpaper.png` in `/yachimdata/images`.
To set lockscreen, place an image named `lockscreen.png` in `/yachimdata/images`.
