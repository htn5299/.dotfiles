{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    extraConfigLua = ''
      -- Custom statusline configuration
      vim.opt.statusline = [[%f %m %r %h %w %=%y %l,%c %p%%]]

      -- Or a more advanced one with functions
      -- function MyStatusline()
      --   -- Your custom statusline code here
      -- end
      -- vim.o.statusline = '%!v:lua.MyStatusline()'
    '';

    opts =
      let
        indentSize = 2;
      in
      {
        splitright = true;
        splitbelow = true;

        mouse = "a";
        nu = true;
        relativenumber = false;
        cursorline = true;
        wrap = true;

        tabstop = indentSize;
        expandtab = true;
        smarttab = true;
        softtabstop = indentSize;
        shiftwidth = indentSize;

        swapfile = false;
        undofile = true;
        undolevels = 30000;
        backup = false;
        breakindent = true;
        completeopt = "menu,menuone,noselect";

        fillchars = {
          eob = " ";
          fold = " ";
          foldclose = "";
          foldopen = "";
          foldsep = " ";
        };

        foldcolumn = "1";
        foldenable = false;
        foldlevel = 99;
        foldlevelstart = 99;
        ignorecase = true;
        inccommand = "split";
        laststatus = 3;
        linebreak = true;
        list = true;

        scrolloff = 12;
        sidescrolloff = 12;

        listchars = {
          nbsp = "␣";
          tab = "» ";
          trail = "·";
        };
      };
  };
}
