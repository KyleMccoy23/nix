
{ ... }:

{
    programs.fish = {
        enable = true;
        shellAliases = {

            sudo = "doas";
            snrs = "sudo nixos-rebuild switch";

            cd = "z";
            nano = "micro";

        };
    };
}