# FIXME: not in config:
# - icon from systemsettings
# - nix-channel
# - omz installation
# - hardware specific

{ inputs, config, pkgs, ... }:
let
  # FIXME:
  # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  # sudo nix-channel --update
  # unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      yachim = import ../home/home.nix;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "yachim-nixos-desktop";
  networking.networkmanager.enable = true;

  programs = {
    git = {
      enable = true;
      config = {
        user = {
          name = "Yachim";
          email = "jachym.kohout@gmail.com";
        };
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
      # TODO: hardware specific?
      enableNvidiaPatches = true;
    };
    steam.enable = true;
    firefox.enable = true;
    zsh = {
      enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # TODO: set automatically
  time.timeZone = "Europe/Prague";

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    # TODO: NVIDIA - hardware specific
    videoDrivers = ["nvidia"];
  };

  sound.enable = true;
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = true;
    # TODO: NVIDIA - hardware specific
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
	finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  users.users.yachim = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  environment = {
    systemPackages = with pkgs; [
      bat
      wget
      neofetch
      discord
      kitty
      gh
      dunst
      eww-wayland
      rofi-wayland
      dolphin
      oh-my-zsh
      lightdm
      zellij
      python3
      unzip
      grim
      slurp
      swappy
      wl-clipboard
      imagemagick
      home-manager
    ];
  };

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ubuntu_font_family
    (nerdfonts.override { fonts = [ "FiraCode" "UbuntuMono" ]; })
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "23.05";
}
