{ pkgs, config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
    };

    extraConfigLua = ''
      local colors_palette = {
      	base00 = "#${palette.base00}",
      	base01 = "#${palette.base01}",
      	base02 = "#${palette.base02}",
      	base03 = "#${palette.base03}",
      	base04 = "#${palette.base04}",
      	base05 = "#${palette.base05}",
      	base06 = "#${palette.base06}",
      	base07 = "#${palette.base07}",
      	base08 = "#${palette.base08}",
      	base09 = "#${palette.base09}",
      	base0A = "#${palette.base0A}",
      	base0B = "#${palette.base0B}",
      	base0C = "#${palette.base0C}",
      	base0D = "#${palette.base0D}",
      	base0E = "#${palette.base0E}",
      	base0F = "#${palette.base0F}",
      }
      require('base16-colorscheme').setup(colors_palette)

      vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#${palette.base03}', bg = '#${palette.base00}' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#${palette.base02}', bg = '#${palette.base00}' })
      vim.api.nvim_set_hl(0, 'FzfLuaBorder', { fg = '#${palette.base03}'})
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#${palette.base03}'})
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#${palette.base00}'})
      vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#${palette.base01}'})
      vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#${palette.base02}'})
      vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#${palette.base01}'})

      vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#${palette.base02}', bg = 'none' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none'})
      vim.api.nvim_set_hl(0, 'FloatTitle', { bg = 'none'})

      vim.api.nvim_set_hl(0, 'Search', { fg = '#${palette.base00}', bg = '#${palette.base04}' })
    '';
  };
}
