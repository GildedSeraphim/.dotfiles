{pkgs, ...}:
{
  imports = [
    ./main.nix
    ./application-launcher.nix
    ./run.nix
    ./clipboard.nix
    ./web-search.nix
    ./selector.nix
    ./selector-big.nix
  ];
}
