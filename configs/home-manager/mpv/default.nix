{
  lib,
  pkgs,
  ...
}:
{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv-unwrapped.wrapper {
      mpv = pkgs.mpv-unwrapped;
      youtubeSupport = true;
      # Useful scripts. Not my entire config, should probably do that
      scripts = with pkgs; [
        mpvScripts.mpris
        mpvScripts.autoload
        mpvScripts.uosc
        mpvScripts.thumbfast
      ];
    };

    bindings = {
      "h" = "cycle deband";
      "Alt+l" = "add sub-scale +0.1";
      "Alt+h" = "add sub-scale -0.1";
      "Alt+j" = "add sub-pos +1";
      "Alt+k" = "add sub-pos -1";
    };

    config =
      let
        sub-font = "Ubuntu Nerd Font";
      in
      {
        keep-open = "yes";
        autofit = "70%";
        volume = 80;
        volume-max = 100;
        alang = "jpn,jp,eng,en,enUS,en-US,de,ger";
        slang = "eng,en,und,de,ger,jp,jap";
        screenshot-format = "png";
        screenshot-high-bit-depth = "yes";
        screenshot-png-compression = 3; # Setting too high may lag the PC.
        screenshot-directory = "~/Pictures/screenshots";
        screenshot-template = "%F - [%P] (%#01n)";
        save-position-on-quit = "yes";
        reset-on-next-file = "audio-delay,mute,pause,speed,sub-delay,video-aspect-override,video-pan-x,video-pan-y,video-rotate,video-zoom,volume";

        # OSD
        # no-osd-bar
        osd-duration = 500;
        osd-font = sub-font;
        osd-font-size = 24;

        # ytdl

        ytdl-format = ''bestvideo[height<=?1080]+bestaudio/best'';
        ytdl-raw-options = ''write-sub=,write-auto-sub=,sub-langs="ja,jp,jpn,en.*"'';

        #
        # Show subs, guess on what subs, prioritize japanese, try to fix timings, make subs a bit bigger
        audio-file-auto = "fuzzy";
        autofit-larger = "100%x100%";
        geometry = "50%:50%";

        # Sub appearance
        inherit sub-font;
        sub-auto = "all";
        sub-visibility = "yes";
        sub-color = "#f7f7f7";
        sub-shadow-color = "#16161D";
        sub-bold = "yes";
        sub-font-size = 56;
        sub-pos = 90;
        sub-back-color = "0.0/0.0/0.0/0.5";
        sub-border-style = "background-box";
        sub-border-size = 0;
        sub-shadow-offset = 7;
        sub-fix-timing = "yes";
        sub-scale-by-window = "no";
        sub-ass-scale-with-window = "no";
        sub-ass-override = "scale";
      };
  };
}
