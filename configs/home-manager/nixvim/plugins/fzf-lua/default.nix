{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    fzf-lua = {
      enable = true;
      settings = {
        default_prompt = true;
        fzf_colors = {
          gutter = "-1";
        };
        keymap = {
          builtin = {
            "<c-u>" = "preview-page-up";
            "<c-d>" = "preview-page-down";
          };
          fzf = {
            "ctrl-e" = "select-all+accept";
          };
        };
        fzf_opts = {
          "--cycle" = "";
        };
        winopts = {
          border = "single";
          backdrop = 100;
          preview = {
            border = "single";
            layout = "flex";
            scrollbar = "float";
          };
        };
        files = {
          prompt = "Files❯ ";
          hidden = false;
          actions = {
            "alt-i" = {
              __raw = "require('fzf-lua.actions').toggle_ignore";
            };
            "alt-h" = {
              __raw = "require('fzf-lua.actions').toggle_hidden";
            };
            "ctrl-q" = {
              fn = {
                __raw = "require('fzf-lua').actions.file_sel_to_qf";
              };
              prefix = "select-all";
            };
          };
        };

        grep = {
          actions = {
            "alt-i" = {
              __raw = "require('fzf-lua.actions').toggle_ignore";
            };
            "alt-h" = {
              __raw = "require('fzf-lua.actions').toggle_hidden";
            };
            "ctrl-q" = {
              fn = {
                __raw = "require('fzf-lua').actions.file_sel_to_qf";
              };
              prefix = "select-all";
            };
          };
        };

        lsp.code_actions.winopts.preview.layout = "vertical";
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = ''<leader>ff'';
      action = ''<cmd>FzfLua files<CR>'';
      options = {
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = ''<leader>fb'';
      action = ''<cmd>FzfLua buffers<CR>'';
      options = {
        desc = "Find Buffers";
      };
    }
    {
      mode = "n";
      key = ''<leader>fs'';
      action = ''<cmd>FzfLua live_grep_native<CR>'';
      options = {
        desc = "Find live grep";
      };
    }
  ];
}
