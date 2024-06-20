{ config, inputs, pkgs, ... }:
let
  myUser = "k3ys"; #adjust this to your username
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in
{
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];
    script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
    wantedBy = [ "multi-user.target" ];
  };
}
