{ pkgs, config, ... }:
let
  colors = config.colorScheme.palette;
in
{
  home.packages = with pkgs; [ ghostty ];
  home.file.".config/ghostty/config".text = ''
    palette = 0=#${colors.base00}
    palette = 1=#${colors.base08}
    palette = 2=#${colors.base0B}
    palette = 3=#${colors.base0A}
    palette = 4=#${colors.base0D}
    palette = 5=#${colors.base0E}
    palette = 6=#${colors.base0C}
    palette = 7=#${colors.base05}
    palette = 8=#${colors.base03}
    palette = 9=#${colors.base0F}
    palette = 10=#${colors.base0B}
    palette = 11=#${colors.base0A}
    palette = 12=#${colors.base0D}
    palette = 13=#${colors.base0E}
    palette = 14=#${colors.base0C}
    palette = 15=#${colors.base07}

    background = #${colors.base00}
    foreground = #${colors.base05}
    cursor-color = #${colors.base06}

    selection-background = #${colors.base02}
    selection-foreground = #${colors.base05}

    mouse-hide-while-typing = true
    window-padding-x = 0
    window-padding-y = 0

    font-family = "JetBrainsMonoNL Nerd Font"
    adjust-cell-width = -8%
    font-size = 12

    window-decoration = false
    keybind = ctrl+shift+space=toggle_window_decorations
    keybind = ctrl+enter=unbind
  '';
}
