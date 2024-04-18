{ pkgs, ... }:

{
    programs.zsh = {
	enable = true;
	dotDir = ".config/zsh";
	enableCompletion = true;

	# Extra commands
	initExtra = ''
	eval "$(zoxide init zsh)"
	eval "$(zellij setup --generate-auto-start zsh)"
	eval "$(starship init zsh)"
	'';

	
	# oh my zsh
	oh-my-zsh = {
	    enable = false;
	    theme = "strug";
	    
	};

	# plugins 
	plugins = with pkgs; [ 
	    {
		name = "zsh-syntax-highlighting";
		src = pkgs.fetchFromGitHub {
		   owner = "zsh-users"; 
		   repo = "zsh-syntax-highlighting";
		   rev = "0.6.0";
		   sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
		};
	    }
	];
    };
}
