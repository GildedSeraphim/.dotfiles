{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "Nord themes"
      "GLSL"
      "Make"
      "Justfile"
      "Zig"
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      ui_font_size = lib.mkForce 16;
      buffer_font_size = lib.mkForce 16;
      load_direnv = "shell_hook";
    };
    extraPackages = with pkgs; [
      nixd
      alejandra
      zls
      ols
    ];
  };
}
