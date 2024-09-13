{ pkgs, ... }:

{
    programs.zsh = {
	enable = true;
	dotDir = ".config/zsh";
	enableCompletion = true;

	# eval "$(zellij setup --generate-auto-start zsh)"
	# Extra commands
	initExtra = ''

	bindkey -r '^T'
	bindkey -s '^T' '~/nixos/home/term_session/tab_switcher \n'

	eval "$(zoxide init zsh)"
	eval "$(starship init zsh)"
	eval "$(direnv hook zsh)"

	'';

	
	# oh my zsh
	oh-my-zsh = {
	    enable = false;
	    theme = "strug";
	    
	};

	# plugins 
	plugins = [ 
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
