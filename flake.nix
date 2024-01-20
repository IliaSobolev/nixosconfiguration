{
	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
	inputs.home-manager.url = "gitlab:rycee/home-manager/release-23.11";
	inputs.hyprland.url = "github:hyprwm/Hyprland";
	outputs = { self, nixpkgs, home-manager, hyprland, ... }:
	let
		system = "x86_64-linux";
		specialArgs = { inherit hyprland; };
	in {
		nixosConfigurations.bebrazawr = nixpkgs.lib.nixosSystem {
		inherit system;
	  	modules = [ 
			./hosts/configuration.nix 
			hyprland.nixosModules.default
			home-manager.nixosModules.home-manager
			{
		  		home-manager.useGlobalPkgs = true;
		  		home-manager.useUserPackages = true;
		  		home-manager.users.bebrazawr = import ./home/home.nix ;
				home-manager.extraSpecialArgs = specialArgs;
			}
			];
		};
	};
}
