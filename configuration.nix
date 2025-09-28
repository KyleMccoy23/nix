# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pkgs.nix
      ./fish.nix
      ./boot.nix
      ./services.nix
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

  programs.zoxide.enable = true;

  security.rtkit.enable = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  system.stateVersion = "25.05"; # Did you read the comment?


}
