# This file is overwritten by the vagrant-nixos plugin
{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/vagrant-network.nix
    /etc/nixos/vagrant-provision.nix
    /etc/nixos/vagrant-hostname.nix
  ];
  config.environment.shellInit = ''
    export NIX_PATH=nixpkgs=http://github.com/mayflower/nixpkgs/archive/production.tar.gz:$NIX_PATH
  '';
}