{ pkgs, ... }:

{
    programs.zsh = {
	enable = true;
	dotDir = ".config/zsh";
	enableCompletion = true;
	autosuggestion.enable = true;

	# eval "$(zellij setup --generate-auto-start zsh)"
	# Extra commands
	initExtra = ''

	# function tab_switcher() {
	#     kitty @ focus-tab --match title:$(kitty @ ls | \
	# 	jq -r '.[0].tabs[] | "\(.id)|\(.title)"' | \
	# 	fzf --layout=reverse \
	# 	    --height=10% \
	# 	    --border=rounded \
	# 	    --border=rounded \
	# 	    --margin=30%,30% \
	# 	    --padding=1 \
	# 	    --with-nth=1 \
	# 	 | \
	# 	awk '{print $0}')
	# }


	export FZF_DEFAULT_OPTS=" \
	--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
	--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
	--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
	--color=selected-bg:#45475a \
	--multi"

	# bindkey -r '^T'
	# bindkey -s '^T' '~/nixos/home/term_session/tab_switcher \n'
	# zle -N tab_switcher
	# bindkey '^T' tab_switcher
	#
	alias ls="eza -la"

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
