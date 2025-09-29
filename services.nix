{ config, ... }:

{

  services = {
    pulseaudio.enable = false;
    #Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable the X11 windowing system.
    xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;

    xserver.videoDrivers = [ "modesetting" "nvidia" ];

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };


    # Enable CUPS to print documents.
    printing.enable = true;

  };
  
}