{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.opt.terminal.ghostty;
in {
  options.opt.terminal.ghostty.enable = mkEnableOption "ghostty";
  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
      };
    };
  };
}
