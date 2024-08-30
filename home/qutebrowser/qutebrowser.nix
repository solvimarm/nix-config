{ ... }:

{
    programs.qutebrowser = {
	enable = true;
	searchEngines = {
	    g = "https://www.google.com/search?hl=en&q={}";
	    b = "https://www.bing.com/search?q={}";
	};

	keyBindings = {
	    normal = {
		" sf"= ":tab-select {text}";
	    };
	};

	extraConfig = ''
import catppuccin
catppuccin.setup(c, 'mocha', True)
	'';
    };
}
