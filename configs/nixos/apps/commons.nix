{ pkgs, ... }:
{

  services.teamviewer.enable = true;

  # tablet
  hardware.opentabletdriver.enable = true;

  # razer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "htn" ];

  environment.systemPackages = with pkgs; [
    godot
    # android-studio
    # android-tools
    # androidenv.androidPkgs.androidsdk
    # androidenv.androidPkgs.emulator
    # androidenv.androidPkgs.ndk-bundle
    # jdk # Java

    # open source for razer
    polychromatic
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
