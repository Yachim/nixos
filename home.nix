{ config, pkgs, ... }:

{
  home.username = "yachim";
  home.homeDirectory = "/home/yachim";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    ".config/eww" = {
      source = ./eww;
      recursive = true;
    };
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
    ".config/zellij" = {
      source = ./zellij;
      recursive = true;
    };
    ".p10k.zsh".source = ./.p10k.zsh;
    ".zshrc".source = ./.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services = {
    dunst = {
      enable = true;
    };
  };

  programs = {
    home-manager.enable = true;

    kitty = {
      enable = true;
      font.name = "AurulentSansMono-Regular Nerd Font Complete";
      settings.background_opacity = "0.85";
    };

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        custom = "$PWD/omz-custom";
        plugins = [
          "git"
          "git-auto-fetch"
          "vi-mode"
          "sudo"
          "docker"
          "docker-compose"
          "npm"
          "magic-enter"
          "colored-man-pages"
          "colorize"
          "command-not-found"
          "z"

          # custom
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "zsh-autocomplete"
          "autoupdate"
        ];
        theme = "powerlevel10k/powerlevel10k";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
	hosts = [ "https://github.com" "https://gist.github.com" ];
      };
      settings = {
        protocol = "https";
	editor = "nvim";
      };
    };

    git = {
      enable = true;
      userName = "yachim";
      userEmail = "jachym.kohout@gmail.com";
      extraConfig = {
          core.EDITOR = "nvim";
          init.defaultBranch = "main";
          pull.rebase = false;
          "credential \"https://gist.github.com\"".helper = "!/run/current-system/sw/bin/gh auth git-credential";
          "credential \"https://github.com\"".helper = "!/run/current-system/sw/bin/gh auth git-credential";
        };
    };
  };
}
