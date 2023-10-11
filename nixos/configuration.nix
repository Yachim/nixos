{ lib, inputs, config, pkgs, ... }:
{
  imports =
    [
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

  networking.networkmanager.enable = true;

  programs = {
    noisetorch = {
      enable = true;
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
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "Hyprland --config /etc/greetd/hyprland.conf";
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
  };

  users.users.yachim = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
  };

  environment = {
    etc = {
      "greetd/hyprland.conf".source = ../etc/greetd/hyprland.conf;
      "greetd/gtkgreet.css".text = ''
        window {
          background-image: url("/yachimdata/images/lockscreen.png");
          background-size: cover;
          color: #FBFBFD; /* base07 */
        }

        revealer {
          padding: 0 500px;
        }

        #window {
          padding: 20px;
          background-color: #28323A; /* base02 */
          opacity: 0.8;
          border-radius: 12px;
        }

        #window > box > box > box > label {
          margin-right: 12px;
        }
      '';
      };
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      lazygit
      fd
      go
      jdk
      php
      nodejs
      julia
      cargo
      rustc
      tree-sitter
      luarocks
      php82Packages.composer
      python310Packages.pip
      libgccjit
      vimPlugins.cmp-nvim-lsp
      vimPlugins.nvim-treesitter-parsers.yaml
      openssl
      obsidian
      ripgrep
      libnotify
      bat
      wget
      neofetch
      discord-canary
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
      greetd.gtkgreet
      gtklock
      cage
      jq
      hyprpicker
      gnumake
      gcc_multi
      fish
      wev
      dotnet-sdk_7
      dotnet-runtime_7
      fsautocomplete
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

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "23.05";
}
