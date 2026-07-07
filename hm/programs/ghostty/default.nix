{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.opt.terminal.ghostty;
in
{
  options.opt.terminal.ghostty.enable = mkEnableOption "ghostty";
  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = with config.lib.stylix.colors.withHashtag; {
        font-family = "${config.stylix.fonts.monospace.name}";
        confirm-close-surface = false;
        window-padding-x = "10, 10";
        window-padding-y = "10";
        adjust-cursor-thickness = "2";
      };
    };
  };
}
