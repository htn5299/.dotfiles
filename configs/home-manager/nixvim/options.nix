{
  programs.nixvim  = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

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
        foldenable = true;
        foldlevel = 99;
        foldlevelstart = 99;
        ignorecase = true;
        inccommand = "split";
        laststatus = 3;
        linebreak = true;
        list = true;

        listchars = {
          nbsp = "␣";
          tab = "» ";
          trail = "·";
        };
      };
  };
}
