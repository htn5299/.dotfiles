{ pkgs, lib, ... }:
{
  programs.joplin-desktop = {
    enable = true;
    sync.target = "dropbox";
  };
}
