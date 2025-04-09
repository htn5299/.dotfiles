{
  config,
  lib,
  pkgs,
  ...
}:
{
  # networking.firewall.interfaces."podman0".allowedTCPPorts = [ 5432 ];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_15;
    authentication = pkgs.lib.mkOverride 10 ''
      			#type database  DBuser                 auth-method
      			local all       all                    trust
      			# podman
      			# host  all       all     10.88.0.0/16   scram-sha-256
      		'';
  };
}
