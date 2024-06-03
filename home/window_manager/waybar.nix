{lib, pkgs, ...}:

{
    programs.waybar = {
        enable = true; 
	settings = {
	    mainBar = {
		layer = "top";
		modules-left = [
		    "hyprland/workspaces"
		];
		modules-center = [
		    "clock"
		];
		modules-right = [
		    "bluetooth"
		    "pulseaudio/slider"
		    "battery" 
		    "tray"
		];
	    };
	};
	"hyprland/workspaces" = {
	    all-outputs = false;
	    format = "{icon}";
	    format-icons = {
		
	    };
	};
	# CSS 
	style = ''

	'';
    };
}
