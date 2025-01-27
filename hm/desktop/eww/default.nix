{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.opt.services.eww;
in {
  options.opt.services.eww.enable = mkEnableOption "eww";

  config = mkIf cfg.enable {
    programs.eww = {
      enable = true;
      enableFishIntegration = true;
      configDir = ../eww;
    };
  };
}
