{
  programs.nixvim.plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Type";
          position = "center";
        };
        type = "text";
        val = [
          "           _                    _                "
          "          (_)                  (_)               "
          " _ .--.   __   _   __  _   __  __   _ .--..--.   "
          "[ `.-. | [  | [ \ [  ][ \ [  ][  | [ `.-. .-. |  "
          " | | | |  | |  > '  <  \ \/ /  | |  | | | | | |  "
          "[___||__][___][__]`\_]  \__/  [___][___||__||__] "
          "                                                 "
        ];
      }
    ];
  };
}
