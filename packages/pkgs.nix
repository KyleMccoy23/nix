
{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [

        kitty
        fish

        git curl wget

         # codecs
        ffmpeg-full
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav

        nvtopPackages.full

        vscodium 

        legcord signal-desktop

        python313 gcc gnumake pkg-config cmake
        ninja autoconf automake libtool
        gettext glibc gdb strace lldb
        clang rustc cargo rust-analyzer
        llvm unzip unrar lz4

        doas

        btop
        zoxide
        tailscale
        pciutils
        fastfetch
        nmap
        micro

        ffmpeg-full
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav

        bitwarden-desktop

        virt-manager
        nvidia-container-toolkit

        grub2

        nixd
        nil
        nix-tree
        nix-output-monitor
        nix-init
        nixpkgs-fmt
        cachix
    ];

      # Install firefox.
    programs.firefox.enable = true;
}