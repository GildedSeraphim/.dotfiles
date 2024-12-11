{...}:
{
  programs.nixvim = {
    plugins.auto-session = {
      settings = {
        auto_restore = true;
      suppressed_dirs = ["~/" "~/dl" "~/desk"];
      };
    };
  };
}