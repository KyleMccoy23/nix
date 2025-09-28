{ config, lib, pkgs, ... }:

{
    # Enable OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
        mesa
        libglvnd
        libvdpau-va-gl
        vulkan-loader
        vulkan-tools
        nvidia-vaapi-driver
      ];
  };


  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    vulkan-tools
    mesa-demos
    cudatoolkit
    ffmpeg_6-full
  ];
}