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

  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;   
  environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  xdg.portal.wlr.enable = true;
  xdg.mime.defaultApplications = {
  "text/html" = "firefox.desktop";
  "x-scheme-handler/http" = "firefox.desktop";
  "x-scheme-handler/https" = "firefox.desktop";
  "x-scheme-handler/about" = "firefox.desktop";
  "x-scheme-handler/unknown" = "firefox.desktop";
  };
  system.stateVersion = "23.11"; # Did you read the comment?
}

