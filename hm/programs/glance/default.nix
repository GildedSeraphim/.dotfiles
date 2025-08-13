{ config, pkgs, ... }:
{
  services.glance = {
    enable = true;
    settings = {
      server = {
        port = 5678;
      };
      pages = [
        {
          name = "Home";
          head-widgets = [
            {
              type = "markets";
              hide-header = true;
              markets = [
                {
                  symbol = "SPY";
                  name = "S&P 500";
                }
              ];
            }
          ];
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "hacker-news";
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "weather";
                  location = "Austin, United States";
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
