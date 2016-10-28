{ config, pkgs, ... }:
{
  networking.interfaces = [
    {
      name      = "enp0s8"; 
      ipAddress    = "176.16.16.16";
      prefixLength = 24;
    }
  ];
}
