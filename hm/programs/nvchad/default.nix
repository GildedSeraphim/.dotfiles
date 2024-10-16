{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      clang-tools
      vimPlugins.lsp-zero-nvim
      python3
    ];

    hm-activation = true;
    backup = false;
  };

}
