{ config, pkgs, ... }:

{
  home.username = "yachim";
  home.homeDirectory = "/home/yachim";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        custom = "./omz-custom";
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
