{
  inputs.systems = {
    url = "path:./systems.flake.nix";
    flake = false;
  };
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }:
    let
      s = import systems;
      forAllSystems = nixpkgs.lib.genAttrs (
        if builtins.length s > 0 then s else nixpkgs.lib.systems.flakeExposed
      );
    in
    {
      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
          inherit self;
        }
      );
      packages = forAllSystems (
        system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system}
      );
      overlays.default = import ./overlay.nix { inherit self; };
      nixosModules = import ./nixos-modules { inherit self; };
      # homeModules = import ./home-modules;
      # darwinModules = import ./darwin-modules;
      # flakeModules = import ./flake-modules;
    };
}
