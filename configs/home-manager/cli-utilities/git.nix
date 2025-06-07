{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "htn";
    userEmail = "htn5299@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-markdown-preview ];
    settings = {
      editor = "nvim";
    };
  };
}
