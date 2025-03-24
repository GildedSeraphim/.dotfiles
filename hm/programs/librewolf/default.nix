{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkEnableOption
    concatStringsSep
    escapeShellArg
    mapAttrsToList
    ;

  cfg = config.opt.browser.librewolf;
in {
  options.opt.browser.librewolf = {
    enable = mkEnableOption "Wether to enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.librewolf = {
      # package = (pkgs.wrapFirefox (pkgs.firefox-devedition-unwrapped.override { pipewireSupport = true; }) { });
      package = pkgs.librewolf-wayland;
      enable = true;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        # DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        # OverrideFirstRunPage = "";
        # OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
        SecurityDevices = {
          Add = {
            "OpenSC PKCS#11" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
          };
        };
      };
      profiles.default = {
        bookmarks = {
          force = true;
          settings = import ./bookmark.nix;
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          clearurls
          cookie-autodelete
          decentraleyes

          darkreader

          tabliss

          sponsorblock
          return-youtube-dislikes
          untrap-for-youtube

          bitwarden

          refined-github
          github-file-icons
          reddit-enhancement-suite

          sidebery
          vimium
        ];

        # userChrome = builtins.readFile ./userChrome.css;
        # userContent = builtins.readFile ./userChrome.css;
        search = {
          force = true;
          engines = {
            # don't need these default ones
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Brave" = {
              urls = [
                {
                  template = "https://search.brave.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@b"];
            };
            "Home Manager Options" = {
              urls = [
                {
                  template = "https://mynixos.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@ho"];
            };
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@np"];
            };
            "YouTube" = {
              urls = [
                {
                  template = "https://www.youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@yt"];
            };
            "Wikipedia" = {
              urls = [
                {
                  template = "https://en.wikipedia.org/wiki/Special:Search";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@w"];
            };

            "GitHub" = {
              urls = [
                {
                  template = "https://github.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = ["@gh"];
            };
          };
          default = "Brave";
        };
        id = 0;
        containersForce = true;
        containers = {
          programming = {
            id = 1;
            icon = "chill";
            color = "red";
          };
          school = {
            id = 2;
            icon = "chill";
            color = "orange";
          };
        };
        settings = {
          # settings = lib.mapAttrs' (n: lib.nameValuePair "pref.${n}") {
          "app.update.auto" = true; # disable auto update
          "dom.security.https_only_mode" = true; # force https
          "extensions.pocket.enabled" = false; # disable pocket
          "browser.quitShortcut.disabled" = true; # disable ctrl+q
          "browser.download.panel.shown" = true; # show download panel
          "signon.rememberSignons" = false; # disable saving passwords
          "identity.fxaccounts.enabled" = false; # disable librewolf accounts
          "app.shield.optoutstudies.enabled" = false; # disable shield studies
          "browser.shell.checkDefaultBrowser" = false; # don't check if default browser
          "browser.bookmarks.restore_default_bookmarks" = false; # don't restore default bookmarks
          # Download handling
          "browser.download.dir" = "/home/meain/down"; # default download dir
          "browser.startup.page" = 3; # restore previous session
          # UI changes
          # "browser.uidensity" = 1; # enable dense UI
          "general.autoScroll" = true; # enable autoscroll
          # "browser.compactmode.show" = true; # enable compact mode
          # "browser.tabs.firefox-view" = false; # enable librewolf view
          "startup.homepage_welcome_url" = ""; # disable welcome page
          "browser.newtabpage.enabled" = false; # disable new tab page
          "full-screen-api.ignore-widgets" = true; # fullscreen within window
          "browser.toolbars.bookmarks.visibility" = "always"; # hide bookmarks toolbar
          "browser.aboutConfig.showWarning" = false; # disable warning about about:config
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true; # disable picture in picture button

          # Privacy
          "browser.discovery.enabled" = false; # disable discovery
          "browser.search.suggest.enabled" = false; # disable search suggestions
          "browser.contentblocking.category" = "custom"; # set tracking protection to custom
          "dom.private-attribution.submission.enabled" = false; # stop doing dumb stuff mozilla
          "browser.protections_panel.infoMessage.seen" = true; # disable tracking protection info

          # Disable telemetry
          "toolkit.telemetry.enabled" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "toolkit.telemetry.unified" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "browser.translations.automaticallyPopup" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;

          # let me close and open tabs without confirmation
          "browser.tabs.loadInBackground" = true; # open new tab in background
          "browser.tabs.loadBookmarksInTabs" = true; # open bookmarks in new tab
          "browser.tabs.warnOnOpen" = false; # don't warn when opening multiple tabs
          "browser.tabs.warnOnQuit" = false; # don't warn when closing multiple tabs
          "browser.tabs.warnOnClose" = false; # don't warn when closing multiple tabs
          "browser.tabs.loadDivertedInBackground" = false; # open new tab in background
          "browser.tabs.warnOnCloseOtherTabs" = false; # don't warn when closing multiple tabs
          "browser.tabs.closeWindowWithLastTab" = false; # don't close window when last tab is closed

          # other
          "media.autoplay.default" = 5; # enable autoplay on open
          "devtools.toolbox.host" = "right"; # move devtools to right
          # "browser.ssb.enabled" = true; # enable site specific browser
          "media.rdd-vpx.enabled" = true; # enable hardware acceleration
          "devtools.cache.disabled" = true; # disable caching in devtools
          "media.ffmpeg.vaapi.enabled" = true; # enable hardware acceleration

          # Fonts
          "font.size.fixed.x-western" = 15;
          "font.minimum-size.x-western" = 13;
          "font.size.variable.x-western" = 15;
          "font.size.monospace.x-western" = 15;
          "browser.display.use_document_fonts" = 1;
          "browser.link.open_newwindow.restriction" = 0;

          "browser.fixup.domainsuffixwhitelist.home" = true;
          "browser.fixup.domainwhitelist.server.home" = true;
          # "keyword.enable" = false; # Disable search when typing unexistent TLD

          # Found from other places
          "accessibility.typeaheadfind.enablesound" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;

          "browser.send_pings" = false;

          # General
          "intl.accept_languages" = "en-US,en";
          "browser.ctrlTab.sortByRecentlyUsed" = false; # (default) Who wants that?
          "browser.download.useDownloadDir" = false; # Ask where to save stuff
          "browser.translations.neverTranslateLanguages" = "de"; # No need :)
          "privacy.clearOnShutdown.history" = false; # We want to save history on exit
          # Allow executing JS in the dev console
          "devtools.chrome.enabled" = true;
          # Disable browser crash reporting
          "browser.tabs.crashReporting.sendReport" = false;
          # Allow userCrome.css
          # https://github.com/yiiyahui/Neptune-Firefox
          "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = false;
          "browser.newtabpage.activity-stream.newtabWallpapers.v2.enabled" = false;
          "widget.non-native-theme.scrollbar.style" = 0;
          # Why the fuck can my search window make bell sounds
          # Why the fuck can my search window make bell sounds

          # Hardware acceleration
          # See https://github.com/elFarto/nvidia-vaapi-driver?tab=readme-ov-file#firefox
          "gfx.webrender.all" = true;
          "media.rdd-ffmpeg.enabled" = true;
          "widget.dmabuf.force-enabled" = true;
          "media.av1.enabled" = false; # XXX: change once I've upgraded my GPU
          # XXX: what is this?
          "media.ffvpx.enabled" = false;

          # Privacy

          # This allows firefox devs changing options for a small amount of users to test out stuff.
          # Not with me please ...
          "app.normandy.enabled" = false;

          "beacon.enabled" = false; # No bluetooth location BS in my webbrowser please
          "device.sensors.enabled" = false; # This isn't a phone
          "geo.enabled" = false; # Disable geolocation alltogether

          # ESNI is deprecated ECH is recommended
          "network.dns.echconfig.enabled" = true;

          # Disable telemetry for privacy reasons
          "toolkit.telemetry.server" = "";
          "extensions.webcompat-reporter.enabled" = false; # don't report compability problems to mozilla
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "browser.urlbar.eventTelemetry.enabled" = false; # (default)

          # Disable some useless stuff
          "extensions.abuseReport.enabled" = false; # don't show 'report abuse' in extensions
          "extensions.formautofill.creditCards.enabled" = false; # don't auto-fill credit card information
          "identity.fxaccounts.toolbar.enabled" = false;
          "identity.fxaccounts.pairing.enabled" = false;
          "identity.fxaccounts.commands.enabled" = false;
          "browser.contentblocking.report.lockwise.enabled" = false; # don't use firefox password manger
          "browser.uitour.enabled" = false; # no tutorial please
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          # disable EME encrypted media extension (Providers can get DRM
          # through this if they include a decryption black-box program)
          "browser.eme.ui.enabled" = false;
          "media.eme.enabled" = false;

          # don't predict network requests
          "network.predictor.enabled" = false;
          "browser.urlbar.speculativeConnect.enabled" = false;

          # disable annoying web features
          "dom.push.enabled" = false; # no notifications, really...
          "dom.push.connection.enabled" = false;
          "dom.battery.enabled" = false; # you don't need to see my battery...

          "signon.autofillForms" = false;
          "signon.firefoxRelay.feature" = "disabled";
          "signon.generation.enabled" = false;
          "signon.management.page.breach-alerts.enabled" = false;
        };
      };
    };
  };
}
