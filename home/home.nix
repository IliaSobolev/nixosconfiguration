{ config, pkgs, ... }:
{
 
 imports = [
	./programs
 ];
 home = {
  username = "bebrazawr";
  homeDirectory = "/home/bebrazawr";

  packages = with pkgs; [
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    firefox
    kitty
    wofi
    telegram-desktop
    grim
    slurp
    swappy
    spotify
    lm_sensors
    termius
    imv
    chromium
    wf-recorder
   ];
   stateVersion = "23.11";
 };
 programs.home-manager.enable = true;
}

