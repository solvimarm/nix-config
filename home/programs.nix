{ pkgs,inputs,... }:

{
	# Direnv 
	# Used for development environments
	programs.direnv = {
		enable = true; 
		enableZshIntegration = true;
		nix-direnv.enable = true;
		silent = true;
	};
	programs.zoxide = {
		enable = true;

	};

	home.packages = with pkgs; [ 
		remmina
		# AWS Stuff 
	    	#aws-sam-cli
		#vscode-langservers-extracted
		#awscli2
		atac
		httpie
		jq
		browsh
		git-credential-manager
		sqlcmd
		qmk
		qmk-udev-rules
		vial
		hyprcursor
		pass
		#gnupg
		#pinentry-all
		openconnect
		ripgrep
		inputs.nixvim_flake.packages.x86_64-linux.default
		smug
		docker-compose
		inputs.zen-browser.packages.x86_64-linux.default
		catppuccin-cursors.mochaDark
		catppuccin-cursors.mochaLight
		catppuccin-cursors.mochaBlue
		catppuccin-cursors.mochaMauve
		nwg-look
		inputs.ghostty.packages.x86_64-linux.default
		inputs.helix.packages.x86_64-linux.default
		wezterm
		spotify-player
		distrobox
	];

#	programs.nixvim_flake.enable = true;

	programs.fzf = {
	    enable = true;
	};

	programs.gpg.enable = true;
	programs.password-store.enable = true;
	services.gpg-agent = {
	    enable = true; 
	    pinentryPackage = pkgs.pinentry.gnome3;
	    extraConfig = ''allow-loopback-pinentry'';
	};




}
