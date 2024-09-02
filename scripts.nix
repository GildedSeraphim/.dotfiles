{ pkgs, system, ... }:
{
    pkgs.writeShellApplication {
        name = "spot";
        runtimeInputs = [pkgs.spotify];

        text = ''
            exec spotify --disable-gpu    
        '';
    }
}
