{ pkgs, config, ... }:
let
  colors = config.colorScheme.colors;
in
{
  home.packages = with pkgs; [ ghostty ];
  home.file.".config/ghostty/config".text = ''
    palette = 0=#${colors.base00}
    palette = 1=#${colors.base01}
    palette = 2=#${colors.base02}
    palette = 3=#${colors.base03}
    palette = 4=#${colors.base04}
    palette = 5=#${colors.base05}
    palette = 6=#${colors.base06}
    palette = 7=#${colors.base07}
    palette = 8=#${colors.base08}
    palette = 9=#${colors.base09}
    palette = 10=#${colors.base0A}
    palette = 11=#${colors.base0B}
    palette = 12=#${colors.base0C}
    palette = 13=#${colors.base0D}
    palette = 14=#${colors.base0E}
    palette = 15=#${colors.base0F}
    background = #${colors.base00}
    foreground = #${colors.base0F}
    cursor-color = #${colors.base0F}
    selection-background = #${colors.base01}
    selection-foreground = #${colors.base0F}

    mouse-hide-while-typing = true
    window-padding-x = 0
    window-padding-y = 0

    font-family = "JetBrainsMonoNL Nerd Font"
    adjust-cell-width = -8%
    font-size = 12

    window-decoration = false
    keybind = ctrl+shift+space=toggle_window_decorations
  '';
}
