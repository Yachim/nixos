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
    regreet = {
      enable = true;
      settings = {
        background = {
          path = /yachimdata/images/lockscreen.jpg;
          fit = "Cover";
        };
        commands = {
          reboot = [ "systemctl" "reboot" ];
          poweroff = [ "systemctl" "poweroff" ];
        };
      };
    };
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

  services = {
    xserver = {
      enable = true;
      # TODO: NVIDIA - hardware specific
      videoDrivers = ["nvidia"];
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "cage -s -- regreet";
          user = "greeter";
        };
      };
    };
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
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      ripgrep
      libnotify
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
      swww
      cliphist
      greetd.greetd
      greetd.regreet
      gtklock
      cage
      jq
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
