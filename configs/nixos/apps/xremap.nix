{ inputs, ... }:
{
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "htn" ];
  users.groups.input.members = [ "htn" ];

  imports = [ inputs.xremap.nixosModules.default ];
  services.xremap = {
    userName = "htn";
    serviceMode = "user";
    config = {
      modmap = [
        {
          name = "CapsLock, nobody needs you";
          remap = {
            CapsLock = "Ctrl_L";
          };
        }

        # for 65% layout keyboard
	{
          name = "alt_r to left";
          remap = {
            Alt_R = "left";
          };
	}
	{
          name = "left to down";
          remap = {
            left = "down";
          };
	}

	{
          name = "down to up";
          remap = {
            down = "up";
          };
	}

	{
          name = "up to capslock";
          remap = {
            up = "CapsLock";
          };
	}

      ];
      keymap = [
        {
          name = "Better Backspace";
          exact_match = true;
          remap = {
            C-h = "Backspace";
          };
        }
	# {
	#   name = "Ctrl-Esc > `";
	#   remap = {
	#     C-Esc = "`";
	#   };
	# }
	# {
	#   name = "Shift-Esc > ~";
	#   remap = {
	#     Shift-Esc = "~";
	#   };
	# }
      ];
    };
  };
}
