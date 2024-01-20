{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    fonts = with pkgs; [
	(nerdfonts.override { fonts = [ "Mononoki" ]; })
	(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
	noto-fonts
      	noto-fonts-cjk
      	noto-fonts-emoji
      	nerdfonts
      	twemoji-color-font
      	fira-code
      	fira-code-symbols
    ];
};
}
