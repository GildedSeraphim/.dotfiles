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
    ./zellij.nix
  ];

  home.packages = with pkgs; [
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
  };

  programs.fish.shellAbbrs = {
    "zj" = "zellij";
  };
}
