{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    neovim
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      esbenp.prettier-vscode
      vscode-icons-team.vscode-icons
      ms-vsliveshare.vsliveshare
      pkgs-unstable.vscode-extensions.jeff-hykin.better-nix-syntax
      asvetliakov.vscode-neovim
    ];
    userSettings = {
      #	  "editor.fontFamily" = "${config.lib.stylix.fonts.monospace}";
      #	  "terminal.integrated.fontFamily" = "${config.lib.stylix.fonts.monospace}";
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs" = {
        "expr" = "import <nixpkgs> { }";
      };
      "formatting" = {
        "command" = ["alejandra"];
      };
      "options" = {
        "nixos" = {
          "expr" = "(builtins.getFlake \"~/.dotfiles/\").nixosConfigurations.nixos.options";
        };
        "home" = {
          "expr" = "(builtins.getFlake \"~/.dotfiles/\").homeConfigurations.sn.options";
        };
      };
      "workbench.colorTheme" = "Stylix";
      "workbench.iconTheme" = "vscode-icons";
      "cmake.configureOnOpen" = true;
      "window.titleBarStyle" = "custom";
      "terminal.integrated.gpuAcceleration" = "off";
      "disable-hardware-acceleration" = true;
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-nvim" = 1;
      };
    };
  };
}
