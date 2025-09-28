{ pkgs, ... }:
{
  boot = {
    loader = {
      # Bootloader.
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub.enable = true;
      grub.efiSupport = true;
      grub.device = "nodev";
      grub.useOSProber = true;

    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail" # if boot fails, boot to shell
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "random.trust_cpu=on"  # Trusts CPU randomness
    ];

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

  };
  
}