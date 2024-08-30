{ lib, pkgs, config,  ...}:

{
    programs.starship = {
	enable = true;
	settings = {
	    aws = {
		disabled = true;
	    };
	    os ={
		disabled = false;
	    };
	};
    };
}
