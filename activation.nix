{ ... }:
{
    home-manager.activationScripts = {
      post-activate = ''
            systemctl --user restart hyprpaper.service
        '';
    };
}
