{...}:
{
  programs.nixvim = {
    plugins = {
      barbar = {
        enable = true;
        settings = {
          animation = true;
          auto_hide = false;
          clickable = true;
          highlight_alternate = false;
          seperator_at_end = false;
          seperator = {
            left = " ";
            right = " ";
          };
        };
      };
    };
  };
}