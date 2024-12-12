{
  programs.nixvim = {
    plugins = {
      cmake-tools = {
        enable = true;
        settings = {
          cmake_build_directory = "build/\${variant:buildtype}";
          cmake_dap_configuration = {
            cwd = "\${workspaceFolder}";
            name = "Launch file";
            program = {
              __raw = ''
                function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
              '';
            };
            request = "launch";
            stopOnEntry = false;
            type = "codelldb";
          };
          cmake_executor = {
            name = "toggleterm";
          };
          cmake_notifications = {
            refresh_rate_ms = 80;
            spinner = [
              "▱▱▱▱▱▱▱"
              "▰▱▱▱▱▱▱"
              "▰▰▱▱▱▱▱"
              "▰▰▰▱▱▱▱"
              "▰▰▰▰▱▱▱"
              "▰▰▰▰▰▱▱"
              "▰▰▰▰▰▰▱"
              "▰▰▰▰▰▰▰"
            ];
          };
          cmake_regenerate_on_save = false;
          cmake_runner = {
            name = "toggleterm";
          };
          cmake_soft_link_compile_commands = false;
        };
      };
    };
  };
}
