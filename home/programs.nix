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
