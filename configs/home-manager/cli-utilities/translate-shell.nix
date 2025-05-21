{ pkgs, ... }:
{
  programs.translate-shell.enable = true;
  programs.translate-shell.settings = {
    hl = "en";
    tl = [
      "vi"
      # "ja"
    ];
    verbose = true;
  };
}
