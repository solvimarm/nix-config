{ inputs,  ... }:


{
	imports = [
		inputs.nix-colors.homeManagerModules.default
		inputs.nixvim.homeManagerModules.nixvim
		#inputs.nixvim_flake.programs.x86_64-linux.default
		./tmux.nix
		./alacritty.nix
		./kitty.nix
		./bat.nix
		./git.nix
		./programs.nix
		./zsh.nix
		./zellij.nix
		./starship.nix
#		./nixvim.nix
#		./window_manager/hyprlock.nix
		#./qutebrowser/qutebrowser.nix
	];

	colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  	home.username = "solvi";
	home.homeDirectory = "/home/solvi";
	
	# Packages for the home manager user 

	#home.packages = with pkgs; [
	#	tmux
	#	neofetch
	#];
	

	home.stateVersion = "24.05";

	programs.home-manager.enable = true;
}
