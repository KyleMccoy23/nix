{ ... }:

{
    networking = {
        hostName = "nixos"; # Define your hostname.

        # Enable networking
        networkmanager.enable = true;

        defaultGateway = {
            address = "10.0.1.1";
            interface = "enp7s0";
        };

        nameservers = [ 
            "10.0.1.1"
            "9.9.9.9"
        ];

        domain = "home.lan";
        
        search = [
            "home.arpa"
        ];

        interface = {
            enp7.ipv4.addresses = [{
                address = "10.0.1.14";
                prefixLength = 24;
            }];

        };

    };


}