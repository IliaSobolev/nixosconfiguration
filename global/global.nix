{config, lib, pkgs, ...}:
{
	imports = [
		./fonts
    ./bash
	];

  environment.systemPackages = with pkgs; [ 
    neovim 
    gcc
    git
    neofetch
    htop
    unzip
    brillo
  ];
}
