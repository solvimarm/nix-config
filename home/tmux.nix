{ pkgs, inputs, ...}:


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
			# Start windows and panes at 1, not 0
			set -g base-index 1
			set -g pane-base-index 1
			set-window-option -g pane-base-index 1
			set-option -g renumber-windows on

			# Pane management
			# bind  %  split-window -h -c "#{pane_current_path}"
			# bind '"' split-window -v -c "#{pane_current_path}"
			#
			# bind c new-window -c "#{pane_current_path}"
			#
			#
			# bind x kill-pane	
			# bind & kill-window

		      # Smart pane switching with awareness of vim splits.
		      # See: https://github.com/christoomey/vim-tmux-navigator
			     is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
			| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

			# Define a custom key table called 'navigate'
			bind-key -T navigate h select-pane -L  # Navigate left
			bind-key -T navigate j select-pane -D  # Navigate down
			bind-key -T navigate k select-pane -U  # Navigate up
			bind-key -T navigate l select-pane -R  # Navigate right

			# Bind 'Ctrl-w' to enter the 'navigate' key table
			# bind-key -n C-w switch-client -T navigate

			# Rebind the keys for copy-mode-vi to work with 'Ctrl-w' prefix
			# bind-key -T copy-mode-vi 'C-w' switch-client -T navigate
			
			set -g @plugin 'omerxx/tmux-sessionx'

	    		set -g @sessionx-bind 'o'
			run '~/.tmux/plugins/tpm/tpm'

		'';
		plugins = with pkgs; [
			# {
			#      plugin = inputs.tmux_sessionx.packages.x86_64-linux.default; 
			#      extraConfig = ''
			#      set -g @sessionx-bind 'O'
			#      '';
			#
			# }
			{
				plugin = tmuxPlugins.catppuccin;
				extraConfig = ''
				set -g @catppuccin_flavour 'mocha'
				'';
			}
			{
				plugin = tmuxPlugins.tmux-fzf;
			}
			# {
			# 	plugin = tmuxPlugins.session-wizard;
			# }
		];

	};
}
