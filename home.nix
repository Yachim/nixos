{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.tokyo-city-dark;

  home.username = "yachim";
  home.homeDirectory = "/home/yachim";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    ".config/eww/eww.scss".text = ''
      $bar-bg: rgba(#${config.colorScheme.colors.base00}, 0.75);
      $unoccupied-workspace-button-color: rgba(#${config.colorScheme.colors.base03}, 0.7);
      $inactive-workspace-button-color: rgba(#${config.colorScheme.colors.base04}, 0.8);
      $text-color: #${config.colorScheme.colors.base07};

      $settings-menu-bg: rgba(#${config.colorScheme.colors.base01}, 0.8);
      $extra-workspaces-bg: $settings-menu-bg;

      $circle-bg: $text-color;

      $scale-bg: #${config.colorScheme.colors.base03};
      $scale-value: #${config.colorScheme.colors.base0D};

      .bar-widget {
        color: $text-color;
        padding-left: 22px;
        padding-right: 12px;
        background-color: $bar-bg;
        border-radius: 100px;
      }

      button {
        color: $text-color;
        border: none;
        background: none;
        box-shadow: none;
        text-shadow: none;
      }

      .workspace-button {
        font-size: 20px;
        color: $unoccupied-workspace-button-color;
        font-weight: bold;

        &.occupied {
          color: $inactive-workspace-button-color;
        }

        &.active {
          color: $text-color;
        }

        &--smaller {
          font-size: 18px;
        }
      }

      .system-button {
        font-size: 24px;
      }

      .background {
        background: none;
      }

      .settings-menu {
        color: $text-color;
        margin-right: 20px;
        padding: 30px;
        background-color: $settings-menu-bg;
        border-radius: 25px;
      }

      .circle {
        background-color: $circle-bg;
      }

      .font-12 {
        font-size: 12px;
      }

      .font-16 {
        font-size: 16px;
      }

      .font-24 {
        font-size: 24px;
      }

      .power-button {
        font-size: 20px;
      }

      scale * {
        border: none;
        padding: 0;
        margin: 0;
        min-height: 10px;
        border-radius: 100px;
      }

      scale slider {
        box-shadow:none;
        background: none;
      }

      scale trough {
        background-color: $scale-bg;
      }

      scale highlight {
        background-color: $scale-value;
      }

      .extra-workspaces-widget {
        color: $text-color;
        padding: 30px;
        background-color: $extra-workspaces-bg;
        border-radius: 25px;
        margin-top: 20px;
      }

      .extra-workspaces-heading {
        font-weight: bold;
      }
    '';
    ".config/eww/eww.yuck".source = ./eww/eww.yuck;
    ".config/eww/scripts".source = ./eww/scripts;
    ".config/eww/widgets".source = ./eww/widgets;

    ".config/gtklock".source = ./gtklock;
    ".config/hypr".source = ./hypr;
    ".config/nvim".source = ./nvim;
    ".config/omz-custom".source = ./omz-custom;
    ".config/swappy".source = ./swappy;
    ".config/zellij/config.kdl".text = ''
      keybinds {
        shared_except "locked" {
          bind "Alt q" {Detach;}
        }
      }
      theme "custom"
      themes {
        custom {
          fg "#${config.colorScheme.colors.base06}"
          bg "#${config.colorScheme.colors.base01}"
          black "#${config.colorScheme.colors.base00}"
          red "#${config.colorScheme.colors.base08}"
          green "#${config.colorScheme.colors.base0B}"
          blue "#${config.colorScheme.colors.base0D}"
          magenta "#${config.colorScheme.colors.base0F}"
          cyan "#${config.colorScheme.colors.base0C}"
          white "#${config.colorScheme.colors.base07}"
          orange "#${config.colorScheme.colors.base09}"
          yellow "#${config.colorScheme.colors.base0A}"
        }
      }
    '';
    ".p10k.zsh".source = ./.p10k.zsh;
    ".config/yachimtheme/colors.scss".text = ''
      $base01: #${config.colorScheme.colors.base01};
      $base02: #${config.colorScheme.colors.base02};
      $base03: #${config.colorScheme.colors.base03};
      $base04: #${config.colorScheme.colors.base04};
      $base05: #${config.colorScheme.colors.base05};
      $base06: #${config.colorScheme.colors.base06};
      $base07: #${config.colorScheme.colors.base07};
      $base08: #${config.colorScheme.colors.base08};
      $base09: #${config.colorScheme.colors.base09};
      $base0A: #${config.colorScheme.colors.base0A};
      $base0B: #${config.colorScheme.colors.base0B};
      $base0C: #${config.colorScheme.colors.base0C};
      $base0D: #${config.colorScheme.colors.base0D};
      $base0E: #${config.colorScheme.colors.base0E};
      $base0F: #${config.colorScheme.colors.base0F};
    '';
    ".config/yachimtheme/colors.json".text = ''{
      "base01": "#${config.colorScheme.colors.base01}",
      "base02": "#${config.colorScheme.colors.base02}",
      "base03": "#${config.colorScheme.colors.base03}",
      "base04": "#${config.colorScheme.colors.base04}",
      "base05": "#${config.colorScheme.colors.base05}",
      "base06": "#${config.colorScheme.colors.base06}",
      "base07": "#${config.colorScheme.colors.base07}",
      "base08": "#${config.colorScheme.colors.base08}",
      "base09": "#${config.colorScheme.colors.base09}",
      "base0A": "#${config.colorScheme.colors.base0A}",
      "base0B": "#${config.colorScheme.colors.base0B}",
      "base0C": "#${config.colorScheme.colors.base0C}",
      "base0D": "#${config.colorScheme.colors.base0D}",
      "base0E": "#${config.colorScheme.colors.base0E}",
      "base0F": "#${config.colorScheme.colors.base0F}"
    }'';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    /*yachimtheme_base01="#${config.colorScheme.colors.base01}";
    yachimtheme_base02="#${config.colorScheme.colors.base02}";
    yachimtheme_base03="#${config.colorScheme.colors.base03}";
    yachimtheme_base04="#${config.colorScheme.colors.base04}";
    yachimtheme_base05="#${config.colorScheme.colors.base05}";
    yachimtheme_base06="#${config.colorScheme.colors.base06}";
    yachimtheme_base07="#${config.colorScheme.colors.base07}";
    yachimtheme_base08="#${config.colorScheme.colors.base08}";
    yachimtheme_base09="#${config.colorScheme.colors.base09}";
    yachimtheme_base0A="#${config.colorScheme.colors.base0A}";
    yachimtheme_base0B="#${config.colorScheme.colors.base0B}";
    yachimtheme_base0C="#${config.colorScheme.colors.base0C}";
    yachimtheme_base0D="#${config.colorScheme.colors.base0D}";
    yachimtheme_base0E="#${config.colorScheme.colors.base0E}";
    yachimtheme_base0F="#${config.colorScheme.colors.base0F}";*/
  };

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
      backgroundColor = "#${config.colorScheme.colors.base01}D0";
      borderColor = "#00000000";
      borderRadius = 25;
      margin = "25";
      progressColor = "#${config.colorScheme.colors.base0B}";
      textColor = "#${config.colorScheme.colors.base07}";
    };
  };

  programs = {
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

    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
        hosts = [ "https://github.com" ];
      };
      settings = {
        protocol = "https";
        editor = "nvim";
      };
    };

    home-manager.enable = true;

    kitty = {
      enable = true;
      font.name = "AurulentSansMono-Regular Nerd Font Complete";
      settings = {
        background = "#${config.colorScheme.colors.base00}";
        background_opacity = "0.9";
        foreground = "#${config.colorScheme.colors.base07}";
        tab_bar_margin_width = 10;
        tab_bar_style = "powerline";
      };
    };

    rofi = {
      enable = true;
      extraConfig = {
        display-drun = "Apps: ";
      };
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in {
          "*" = {
            background-color = mkLiteral "inherit";
            color = mkLiteral "inherit";
          };

          window = {
            background-color = mkLiteral "#${config.colorScheme.colors.base01}";
            color = mkLiteral "#${config.colorScheme.colors.base07}";
            width = mkLiteral "40%";
            border-color = mkLiteral "#${config.colorScheme.colors.base03}";
          };

          inputbar = {
            children = map mkLiteral [ "prompt" "entry" ];
            background-color = mkLiteral "#${config.colorScheme.colors.base02}";
          };

          "inputbar, listview" = {
            padding = 16;
          };
        };
    };

    zsh = {
      enable = true;
      shellAliases = {
        cat = "bat";
      };
      oh-my-zsh = {
        enable = true;
        custom = "$YACHIM_CONFIG_DIR/omz-custom";
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
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings.general = {
      "col.active_border" = "#${config.colorScheme.colors.base0C}";
      "col.inactive_border" = "#${config.colorScheme.colors.base04}";
    };
  };
}
