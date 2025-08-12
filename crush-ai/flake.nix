{
  description = "Crush via nix-ai-tools (no hashes needed)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # or "nixos-unstable"
    nix-ai-tools.url = "github:numtide/nix-ai-tools";
  };

  outputs = { self, nixpkgs, nix-ai-tools }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      packages = forAllSystems (system: {
        crush = nix-ai-tools.packages.${system}.crush;
        default = nix-ai-tools.packages.${system}.crush;
      });

      apps = forAllSystems (system: {
        crush = {
          type = "app";
          program = "${self.packages.${system}.crush}/bin/crush";
        };
        default = self.apps.${system}.crush;
      });
    };
}

