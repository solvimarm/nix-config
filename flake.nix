{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nix color scheme
    nix-colors.url = "github:misterio77/nix-colors";

    nixvim_flake.url = "github:solvimarm/nixvim";

    tmux_sessionx.url = "github:omerxx/tmux-sessionx";

    # zen browser
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim_flake, tmux_sessionx, zen-browser, ... }: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
	#nixvim_flake.packages.x86_64-linux.default
	

        # home manager 
        home-manager.nixosModules.home-manager{
          home-manager.extraSpecialArgs = { inherit inputs; };
          # home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.solvi = import ./home;

	  home-manager.backupFileExtension = "backup";
        }
        # nixvim
       # #nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
