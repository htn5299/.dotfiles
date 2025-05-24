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
        keep-open = ''yes'';
        autofit = "80%";
        volume = 80;
        volume-max = 100;

        # hwdec = "auto";
        # vo = "gpu";

        alang = ''english,eng,en,japanese,jpn,jap,ja,jp'';
        slang = ''english,eng,en,japanese,jpn,jap,ja,jp'';
        screenshot-format = ''png'';
        screenshot-high-bit-depth = ''yes'';
        screenshot-png-compression = 3; # Setting too high may lag the PC.
        screenshot-directory = ''~/Pictures/screenshots'';
        screenshot-template = "%F - [%P] (%#01n)";
        save-position-on-quit = ''yes'';
        reset-on-next-file = "audio-delay,mute,pause,speed,sub-delay,video-aspect-override,video-pan-x,video-pan-y,video-rotate,video-zoom,volume";

        # OSD
        # no-osd-bar
        osd-duration = 500;
        osd-font = sub-font;
        osd-font-size = 24;

        # ytdl
        ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";

        # Show subs, guess on what subs, prioritize japanese, try to fix timings, make subs a bit bigger
        audio-file-auto = "fuzzy";
        autofit-larger = "100%x100%";
        geometry = "50%:50%";

        # Sub appearance
        inherit sub-font;
        # sub-auto = ''fuzzy'';
        # sub-pos = 90;
        # sub-bold = ''yes'';
        # sub-font-size = 56;
        sub-scale-by-window = ''no'';
        sub-ass-scale-with-window = ''no'';
        sub-ass-override = ''scale'';

        sub-auto = "fuzzy";
        sub-font-size = ''52'';
        sub-color = ''0.95/0.95/0.95/1'';
        sub-blur = ''0.2'';
        sub-bold = ''yes'';
        sub-border-size = ''3'';
        sub-border-color = ''0.05/0.05/0.05/1'';
        sub-spacing = ''1.5'';
        sub-shadow-offset = ''1'';
        sub-shadow-color = ''0/0/0/0.25'';
        sub-use-margins = ''no'';
        sub-margin-y = ''50'';
        sub-margin-x = ''100'';
        sub-scale-with-window = ''no'';
        demuxer-mkv-subtitle-preroll = ''yes'';
        sub-fix-timing = ''no'';
      };
  };
}
