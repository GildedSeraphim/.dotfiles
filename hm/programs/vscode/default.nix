
{pkgs, pkgs-unstable, lib, config,  ...}:

{
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
	];
        userSettings = {
#	  "editor.fontFamily" = "${config.lib.stylix.fonts.monospace}";
#	  "terminal.integrated.fontFamily" = "${config.lib.stylix.fonts.monospace}";
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
