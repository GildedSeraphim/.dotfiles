{ pkgs, lib, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    profiles.sn = {
      search = {
        force = true;
        default = "Brave";
        privateDefault = "Brave";
        engines = {
          "Brave" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
          };
        "Bing".metaData.hidden = true;
        };
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        auto-tab-discard
        bitwarden
        clearurls
        privacy-badger
        darkreader
        sidebery
        decentraleyes
#        mtab
        sponsorblock
        unpaywall
        ublock-origin
      ];      
    };
  };
}
