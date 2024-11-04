{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.gruvbox
      tmuxPlugins.cpu
      tmuxPlugins.battery
    ];
  };
}
