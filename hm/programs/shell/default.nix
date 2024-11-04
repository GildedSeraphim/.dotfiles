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
  ];

  home.packages = with pkgs; [
  ];

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    eval $(${pkgs.thefuck}/bin/thefuck --alias)
    eval "$(direnv hook bash)"
  '';
  programs.bash.shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "dot" = "cd /home/sn/.dotfiles/";
    "neo" = "nitch";
    "cl" = "clear";
    "fui" = "nix run github:vimjoyer/nix-update-input";
    "nt" = "nix-tree";
    "dl" = "cd $HOME/Downloads";
    "doc" = "cd $HOME/Documents";
  };
}
