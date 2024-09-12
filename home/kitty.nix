{ ... }:

{
    programs.kitty = {
	enable = true;
	theme = "Catppuccin-Mocha";
	settings = {
	    enable_audio_bell = false;
	    shell = "zsh";
	    listen_on = "unix:@mykitty";	
	    enabled_layouts = "tall";

	    window_margin_width = "3.0";
	    window_border_width = "2pt";
	    window_padding_width = "3";
	    active_border_color = "#f5c2e7";
	    hide_window_decorations = "yes";

	};
	shellIntegration.enableZshIntegration = true;
	keybindings = {
	    # Jump around neighboring window Vi key binding
	     #"ctrl+shift+w>h" =  "neighboring_window left";
	     #"ctrl+shift+w>l" = "neighboring_window right";
	     #"ctrl+shift+w>j" =  "neighboring_window down";
	     #"ctrl+shift+w>k" = "neighboring_window up";
	    # Create a new window splitting the space used by the existing one so that
	    # the two windows are placed one above the other
	     "ctrl+w>n" = "launch --location=hsplit --cwd=current";
	    # Create a new window splitting the space used by the existing one so that
	    "ctrl+w>c" = "close_window";
	    # the two windows are placed side by side
	     "ctrl+w>j" =  "kitten pass_keys.py bottom ctrl+j";
	     "ctrl+w>k" = "kitten pass_keys.py top    ctrl+k";
	     "ctrl+w>h" = "kitten pass_keys.py left   ctrl+h";
	     "ctrl+w>l" = "kitten pass_keys.py right  ctrl+l";
	};
    };
}
