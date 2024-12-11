{...}: {
  programs.nvim = {
    plugins = {
      noice = {
        enable = true;
        settings = {
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
            lsp_doc_border = false;
          };
          redirect = {
            filter = {
              event = "msg_show";
            };
            view = "popup";
          };
          commands = {
            history = {
              view = "split";
              opts = {
                enter = true;
                format = "details";
              };
              filter = {
                any = [
                  {
                    event = "notify";
                  }
                  {
                    error = true;
                  }
                  {
                    warning = true;
                  }
                  {
                    event = "msg_show";
                    kind = [
                      ""
                    ];
                  }
                  {
                    event = "lsp";
                    kind = "message";
                  }
                ];
              };
            };
            last = {
              view = "popup";
              filter_opts = {
                count = 1;
              };
              opts = {
                enter = true;
                format = "details";
              };
              filter = {
                any = [
                  {
                    event = "notify";
                  }
                  {
                    error = true;
                  }
                  {
                    warning = true;
                  }
                  {
                    event = "msg_show";
                    kind = [
                      ""
                    ];
                  }
                  {
                    event = "lsp";
                    kind = "message";
                  }
                ];
              };
            };
            errors = {
              view = "popup";
              opts = {
                enter = true;
                format = "details";
              };
              filter = {error = true;};
              filter_opts = {reverse = true;};
            };
            all = {
              view = "split";
              opts = {
                enter = true;
                format = "details";
              };
              filter = {};
            };
          };
          cmdline = {
            enabled = true;
            view = "cmdline_popup";
            opts = {};
            format = {
              cmdline = {
                icon = "";
                lang = "vim";
                pattern = "^:";
              };
              filter = {
                icon = "$";
                lang = "bash";
                pattern = "^:%s*!";
              };
              help = {
                icon = "";
                pattern = "^:%s*he?l?p?%s+";
              };
              input = {};
              lua = {
                icon = "";
                lang = "lua";
                pattern = "^:%s*lua%s+";
              };
              search_down = {
                icon = " ";
                kind = "search";
                lang = "regex";
                pattern = "^/";
              };
              search_up = {
                icon = " ";
                kind = "search";
                lang = "regex";
                pattern = "?%?";
              };
            };
          };
          health = {
            checker = true;
          };
          lsp = {
            progress = {
              enabled = true;
              format = "lsp_progress";
              format_done = "lsp_progress_done";
              throttle = 1000 / 30;
              view = "mini";
            };
            override = {
              "cmp.entry.get_documentation" = false;
              "vim.lsp.util.convert_input_to_markdown_lines" = false;
              "vim.lsp.util.stylize_markdown" = false;
            };
            hover = {
              enabled = true;
              silent = false;
              view = null;
              opts = {};
            };
            signature = {
              enabled = true;
              auto_open = {
                enabled = true;
                trigger = true;
                luasnip = true;
                throttle = 50;
              };
              view = null;
              opts = {};
            };
            message = {
              enabled = true;
              view = "notify";
              opts = {};
            };
            documentation = {
              view = "hover";
              opts = {
                lang = "markdown";
                replace = true;
                render = "plain";
                format = ["{message}"];
                win_options = {
                  concealcursor = "n";
                  concleallevel = 3;
                };
              };
            };
          };
          mardown = {
            hover = {
              "|(%S-)|" = "vim.cmd.help";
            };
            highlights = {
              "|%S-|" = "@text.reference";
              "@%S+" = "@parameter";
              "^%s*(Parameters:)" = "@text.title";
              "^%s*(Return:)" = "@text.title";
              "^%s*(See also:)" = "@text.title";
              "{%S-}" = "@parameter";
            };
          };
          messages = {
            enabled = true;
            view = "notify";
            view_error = "notify";
            view_warn = "notify";
            view_history = "messages";
            view_search = "virtualtext";
          };
          popupmenu = {
            enabled = true;
            backedn = null;
            kind_icons = {};
            redirect = {
              view = "popup";
              filter = {event = "msg_show";};
            };
          };
        };
      };
    };
  };
}
