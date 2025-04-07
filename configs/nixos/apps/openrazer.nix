{ pkgs, ...} : 

{
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["htn"];
  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
