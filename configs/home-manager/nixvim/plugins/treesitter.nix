{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      lazyLoad.settings = {
        cmd = [
          "TSInstall"
          "TSUpdate"
          "TSUpdateSync"
        ];

        event = [
          "BufNewFile"
          "BufReadPost"
          "BufWritePost"
          "DeferredUIEnter"
        ];

        lazy.__raw = "vim.fn.argc(-1) == 0";
      };
      nixvimInjections = true;

      folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        # ensure_installed = "all";
        auto_install = true;
      };
    };
    treesitter-textobjects = {
      enable = true;
      move = {
        enable = true;
        setJumps = true;
        gotoPreviousStart = {
          "[f" = {
            query = "@function.outer";
            desc = "previous function";
          };
          "[c" = {
            query = "@class.outer";
            desc = "previous class";
          };
          "[p" = {
            query = "@parameter.inner";
            desc = "previous parameter";
          };
        };
        gotoNextStart = {
          "]f" = {
            query = "@function.outer";
            desc = "next function";
          };
          "]c" = {
            query = "@class.outer";
            desc = "next class";
          };
          "]p" = {
            query = "@parameter.inner";
            desc = "next parameter";
          };
        };
      };
      select = {
        enable = true;
        lookahead = true;
        includeSurroundingWhitespace = false;
        keymaps = {
          "af" = {
            query = "@function.outer";
          };
          "if" = {
            query = "@function.inner";
          };
          "ac" = {
            query = "@class.outer";
          };
          "ic" = {
            query = "@class.inner";
          };
          "ai" = {
            query = "@conditional.outer";
          };
          "ii" = {
            query = "@conditional.inner";
          };
          "al" = {
            query = "@loop.outer";
          };
          "il" = {
            query = "@loop.inner";
          };
          "ap" = {
            query = "@parameter.outer";
          };
          "ip" = {
            query = "@parameter.inner";
          };
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = {
            query = "@parameter.inner";
            desc = "swap next parameter";
          };
        };
        swapPrevious = {
          "<leader>A" = {
            query = "@parameter.inner";
            desc = "swap previous parameter";
          };
        };
      };
    };

    treesitter-refactor = {
      enable = false;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
