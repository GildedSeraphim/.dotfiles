{
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      #      __GL_VRR_ALLOWED = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      #      WLR_RENDER_ALLOW_SOFTWARE = "1";
      CLUTTER_BACKEND = "wayland";
      #      WLR_RENDERER = "vulkan";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
