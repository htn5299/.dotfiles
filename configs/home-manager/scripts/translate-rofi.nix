{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "translate-rofi";
  runtimeInputs = with pkgs; [
  ];
  text = ''
    input=$(rofi -dmenu -p "Translate")

    # Check if input is not empty
    if [[ -n "$input" ]]; then
        # Translate the input
        translation=$(trans -b "$input")

        # Remove newlines from translation
        clean_translation=$(echo "$translation" | tr -d '\n')

        # Only notify if translation is not empty
        if [[ -n "$clean_translation" ]]; then
            dunstify -t 5000 "Translation" "$input\n$clean_translation"
        fi
    fi
  '';
}
