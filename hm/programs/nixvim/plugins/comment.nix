{...}:
{
  programs.nixvim = {
    plugins = {
      comment = {
        enable = true;
        settings = {
          padding = true;
          pre_hook = "ts_context_commentstring.create_pre_hook()";
        };
      };
    };
  };
}