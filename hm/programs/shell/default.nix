{ pkgs, config,  ... }:
{
  imports = [
    ./starship.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    thefuck
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      dl = "cd $HOME/Downloads";
      docs = "cd $HOME/Documents";
      dots = "cd $HOME/.dotfiles/";
      neo = "nitch";
      cl = "clear";
      fui = "nix run github:vimjoyer/nix-update-input";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

}
