{ lib, pkgs, ...}:

{
	programs.tmux = {
		enable = true;
		clock24 = true;
		keyMode = "vi";
		mouse = true;
		shell = "${pkgs.zsh}/bin/zsh";
		escapeTime = 1;
		terminal = "screen-256color";
		prefix = "C-Space";
		extraConfig = ''
			# status bar 
			set -g status-position top
			# vim like movement
			bind -r k select-pane -U
			bind -r j select-pane -D
			bind -r h select-pane -L
			bind -r l select-pane -R

			# Start windows and panes at 1, not 0
			set -g base-index 1
			set -g pane-base-index 1
			set-window-option -g pane-base-index 1
			set-option -g renumber-windows on

			# Pane management
			bind  %  split-window -h -c "#{pane_current_path}"
			bind '"' split-window -v -c "#{pane_current_path}"

			bind c new-window -c "#{pane_current_path}"


			bind x kill-pane	
			bind & kill-window



		'';
		plugins = with pkgs; [
			{
				plugin = tmuxPlugins.catppuccin;
				extraConfig = ''
				set -g @catppuccin_flavour 'mocha'
				'';
			}
			{
				plugin = tmuxPlugins.tmux-fzf;
			}
			{
				plugin = tmuxPlugins.session-wizard;
			}
		];

	};
}
