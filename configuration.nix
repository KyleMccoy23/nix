
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages/pkgs.nix
      ./packages/fish.nix
      ./boot.nix
      ./services.nix
      ./graphics.nix
    ];

 users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" "libvirtd" ];
    shell = pkgs.fish;
  };

  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
    groups = [ "wheel" ];

    keepEnv = true;
    persist = true;

  }];

  security.rtkit.enable = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  system.stateVersion = "25.05";

}