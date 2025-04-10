{config, ...}: {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = let
        browser = ["zen-beta.desktop"];
        fileManager = ["org.gnome.Nautilus.desktop"];
        editor = ["vscodium.desktop"];
        player = ["vlc.desktop"];
        viewer = ["nsxiv.desktop"];
        reader = ["org.pwmt.zathura.desktop"];
      in {
        "application/pdf" = reader;
        "application/epub" = reader;

        "text/html" = browser;
        "text/xml" = browser;
        "text/plain" = editor;
        "text/*" = editor;
        "application/x-wine-extension-ini" = editor;

        "application/json" = browser;
        "application/xml" = browser;
        "application/xhtml+xml" = browser;
        "application/xhtml_xml" = browser;
        "application/rdf+xml" = browser;
        "application/rss+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;

        "x-scheme-handler/about" = browser;
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;

        "inode/directory" = fileManager;
        "application/zip" = fileManager;

        "audio/*" = player;
        "video/*" = player;

        "image/*" = viewer;
        "image/gif" = viewer;
        "image/jpeg" = viewer;
        "image/png" = viewer;
        "image/webp" = viewer;
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/dl";
      documents = "${config.home.homeDirectory}/dox";
      desktop = "${config.home.homeDirectory}/desk";
      videos = "${config.home.homeDirectory}/vid";
      pictures = "${config.home.homeDirectory}/pix";
      music = "${config.home.homeDirectory}/music";
      templates = "${config.home.homeDirectory}/.local/share/templates";
      publicShare = "${config.home.homeDirectory}/.local/share/public";
    };
    configFile."electron-flags.conf".text = ''
      --enable-features=WaylandWindowDecorations
      --enable-features=UseOzonePlatform
      --ozone-platform-hint=wayland
    '';
  };
}
