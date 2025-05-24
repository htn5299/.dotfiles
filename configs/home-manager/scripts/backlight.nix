{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "backlight";
  runtimeInputs = with pkgs; [
  ];
  text = ''
    CURRENTBRIGHTNESS=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
    if [ "$CURRENTBRIGHTNESS" -lt 30 ] && [ "$1" = "down" ]; then exit 1; fi

    send_notification() {
    	BRIGHTNESS=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
    	dunstify -a "Backlight" -u low -r 9994 -h int:value:"$BRIGHTNESS" -i "brightness" "Brightness" "Currently at $CURRENTBRIGHTNESS%" -t 1000
    }

    case $1 in
    	up)
    		brightnessctl -e4 set 5%+
    		send_notification "$1"
    		;;
    	down)
    		brightnessctl -e4 set 5%-
    		send_notification "$1"
    		;;
    esac
  '';
}
