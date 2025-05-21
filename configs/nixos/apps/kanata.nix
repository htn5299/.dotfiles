{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Replace the paths below with the appropriate device paths for your setup.
          # Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.1-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           esc
           tab
           caps h j k l

                     up
           ralt left down right
          )
          (defvar
           tap-time 200
           hold-time 200
          )
          (defalias
           caps (tap-hold $tap-time $hold-time esc lmet)
           tab (tap-hold $tap-time $hold-time tab (layer-toggle tab-layer))
          )
          (deflayer base
           _
           @tab
           @caps _ _ _ _

                     ralt
           left down up right
          )
          (deflayer tab-layer
           grv
           _
           _ left down up right

               _
           _ _ _ _
          )
        '';
      };
    };
  };
}
