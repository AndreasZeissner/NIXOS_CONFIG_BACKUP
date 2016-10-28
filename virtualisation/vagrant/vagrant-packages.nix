{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ findutils iputils nettools netcat nfs-utils rsync ];
}

