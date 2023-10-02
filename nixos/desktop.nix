# FIXME: not in config:
# - nix-channel
# - hardware specific

{ inputs, config, pkgs, ... }:
{
  networking.hostName = "yachim-nixos-desktop";

  # nvidia
  programs.hyprland.enableNvidiaPatches = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
