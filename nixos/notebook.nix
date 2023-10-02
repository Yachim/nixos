{ inputs, config, pkgs, ... }:
{
  imports = [./hardware-configuration-notebook.nix];

  networking.hostName = "yachim-nixos-notebook";

  environment.sessionVariables = {
    YACHIM_CONFIG_DIR = "/home/yachim/nixos";
  };
}
