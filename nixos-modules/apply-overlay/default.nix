{ modulesPath, ... }:
let
  overlays = import (modulesPath + "/overlays.nix");
in
{
  nixpkgs.overlays = [
    overlays
  ];
}
