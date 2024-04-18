{ config, pkgs, inputs,  ... }:


{
	imports = [
		inputs.nix-colors.homeManagerModules.default
		inputs.nixvim.homeManagerModules.nixvim
#		./tmux.nix
		./alacritty.nix
		./git.nix
		./programs.nix
		./zsh.nix
		./zellij.nix
		./starship.nix
		./nixvim.nix
	];

	colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  	home.username = "solvi";
	home.homeDirectory = "/home/solvi";
	
	# Packages for the home manager user 

	#home.packages = with pkgs; [
	#	tmux
	#	neofetch
	#];

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
