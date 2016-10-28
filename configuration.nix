{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./tools/vim/default.nix
      ./tools/default.nix
      ./networking/hostnames.nix
      ./networking/network-interfaces.nix
      ./policystuff/default.nix
      ./virtualisation/vagrant/vagrant-packages.nix
#      ./virtualisation/vagrant/vagrant-user.nix
      #./usersgroups/default.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  # Service to start
  services.openssh.enable    = true;
  services.dbus.enable       = true;
#  services.timesynced.enable = true; 
  
  # for easy access atm 
#   virtualisation.virtualbox.guest.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";
}
