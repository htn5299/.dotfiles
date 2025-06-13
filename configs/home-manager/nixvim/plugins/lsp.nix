{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    lsp-lines = {
      enable = true;
    };
    lsp-format = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    schemastore = {
      enable = true;
      yaml.enable = true;
      json.enable = false;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "github:elythh/flake)""'';
              flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim)""'';
            in
            {
              nixpkgs = {
                expr = "import ${flake}.inputs.nixpkgs { }";
              };
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
              options = {
                nixos.expr = ''${flake}.nixosConfigurations.grovetender.options'';
                nixvim.expr = ''${flakeNixvim}.packages.${pkgs.system}.default.options'';
              };
            };
        };
        html = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        # nil_ls = {
        #   enable = true;
        # };
        ts_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        gopls = {
          enable = true;
        };
        terraformls = {
          enable = true;
        };
        ansiblels = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          K = {
            action = "hover";
            desc = "LSP: Hover";
          };
          "<leader>ld" = {
            action = "definition";
            desc = "LSP: Goto Definition";
          };
          "<leader>lr" = {
            action = "references";
            desc = "LSP: Goto References";
          };
          "<leader>lD" = {
            action = "declaration";
            desc = "LSP: Goto Declaration";
          };
          "<leader>li" = {
            action = "implementation";
            desc = "LSP: Goto Implementation";
          };
          "<leader>lt" = {
            action = "type_definition";
            desc = "LSP: Type Definition";
          };
          "<leader>lw" = {
            action = "workspace_symbol";
            desc = "LSP: Workspace Symbol";
          };
          "<leader>la" = {
            action = "code_action";
            desc = "LSP: Action";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "LSP: Rename";
          };
        };

        diagnostic = {
          J = {
            action = "open_float";
            desc = "LSP: Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "LSP: Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "LSP: Previous Diagnostic";
          };
        };
      };
    };
  };
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    ansible-vim
  ];

  programs.nixvim.extraConfigLua = ''
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end;
  '';
}
