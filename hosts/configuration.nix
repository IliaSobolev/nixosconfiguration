{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./modules
      ./users/users.nix
      ../global/global.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;   
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  xdg.portal.wlr.enable = true;
  virtualisation.docker.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}

