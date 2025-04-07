{ pkgs, ...} :

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "lockscreen";
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };
      
      listener = [ 
        {
          timeout = 360;                                # 6min
          on-timeout = "brightnessctl -e4 -s set 25%";    # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r";                 # monitor backlight restore.
        }
        
        {
          timeout = 660;                              # 11min
          on-timeout = "hyprctl dispatch exec hyprlock";          # lock screen when timeout has passed
        }
        
        {
          timeout = 720;                               # 12min
          on-timeout = "hyprctl dispatch dpms off";      # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on";        # screen on when activity is detected after timeout has fired.
        }
        
        {
          timeout = 3660;                              # 61min
          on-timeout = "systemctl suspend";              # suspend pc
        }
      ];
    };
  };
}
