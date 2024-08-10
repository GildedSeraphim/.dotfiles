{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
    ];
    
    extraConfig = inputs.nvchad-on-steroids;
    hm-activation = true;
    backup = true;
  };

}
