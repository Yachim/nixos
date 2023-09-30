# FIXME: not in config:
# - nix-channel
# - hardware specific

{ inputs, config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      yachim = import ../home.nix;
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
      mako
      eww-wayland
      rofi-wayland
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
      tree
      gnome.nautilus
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
