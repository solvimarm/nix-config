{ pkgs, ... }:

{
	# Direnv 
	# Used for development environments
	programs.direnv = {
		enable = false; 
		# silent = true;
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
	];


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
