{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      clang-tools
      vimPlugins.lsp-zero-nvim
      python3
      alejandra
    ];

    hm-activation = true;
    backup = false;
  };
}
