{ pkgs, ...}:


{
	programs.tmux = {
		enable = true;
		clock24 = true;
		keyMode = "vi";
		mouse = true;
		shell = "${pkgs.zsh}/bin/zsh";
		escapeTime = 1;
		terminal = "xterm-256color";
		prefix = "C-Space";
		extraConfig = ''
# status bar 
set -g status-position top
# Start windows and panes at 1, not 0
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

set-option -g allow-rename off
set-window-option -g automatic-rename off
set-window-option -g automatic-rename-format ""



# Smart pane switching with awareness of vim splits.
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

# Define a custom key table called 'navigate'
bind-key -T navigate h select-pane -L  # Navigate left
bind-key -T navigate j select-pane -D  # Navigate down
bind-key -T navigate k select-pane -U  # Navigate up
bind-key -T navigate l select-pane -R  # Navigate right
bind-key -T navigate c kill-pane       # Kill Pane
bind-key -T navigate V split-window -h -c "#{pane_current_path}" # Split pane vertically with Ctrl-w V
bind-key -T navigate S split-window -v -c "#{pane_current_path}" # Split pane horizontally with Ctrl-w S

# Bind 'Ctrl-w' to enter the 'navigate' key table
# bind-key -n C-w switch-client -T navigate
bind-key -n C-w if-shell "$is_vim" "send-keys C-w" "switch-client -T navigate"

bind-key -T navigate t new-window -c "#{pane_current_path}"  # Ctrl-w t to create a new tab

# Navigate windows
bind h select-window -t 1
bind j select-window -t 2
bind k select-window -t 3
bind l select-window -t 4
bind ð select-window -t 5

bind y select-window -t 1
bind h select-window -t 2
bind a select-window -t 3
bind e select-window -t 4
bind i select-window -t 5

#Rebind the keys for copy-mode-vi to work with 'Ctrl-w' prefix
bind-key -T copy-mode-vi 'C-w' switch-client -T navigate

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
