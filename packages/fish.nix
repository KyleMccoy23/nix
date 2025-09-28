{ pkgs, ... }:

{
    programs.fish = {
        enable = true;
        shellInit = ''
            # Run zoxide init
            ${pkgs.zoxide}/bin/zoxide init fish | source

            # Remove fish greeting
            functions -e fish_greeting 2>/dev/null
            function fish_greeting; end
            '';
            
        shellAliases = {

            sudo = "doas";
            snrs = "sudo nixos-rebuild switch";

            cd = "z";
            nano = "micro";

        };
    };
}