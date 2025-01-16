{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./starship.nix
    ./zoxide.nix
    ./direnv.nix
    ./tmux.nix
    ./eza.nix
  ];

  home.packages = with pkgs; [
    pfetch
    onefetch
  ];

  
  programs.fish.enable = true;

  programs.fish.shellAliases = {
    l = "eza -al";
    cd = "z";
    ls = "eza";
    ll = "eza -l";
    ".." = "cd ..";
    "dot" = "cd /home/sn/.dotfiles/";
    "neo" = "nitch";
    "cl" = "clear";
    "fui" = "nix run github:vimjoyer/nix-update-input";
    "nt" = "nix-tree";
    "dl" = "cd $HOME/Downloads";
    "doc" = "cd $HOME/Documents";
    "develop" = "nix develop --command fish";
    "vpn-on" = "systemctl start wg-quick-wg0";
    "vpn-off" = "systemctl stop wg-quick-wg0";
  };

  programs.fish.shellAbbrs = {
    "zj" = "zellij";
  };
}
