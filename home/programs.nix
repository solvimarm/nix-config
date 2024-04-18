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
		aws-sam-cli
		awscli2
	];

	programs.fzf = {
	    enable = true;
	};
}
