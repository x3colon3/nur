{
  pkgs ? import <nixpkgs> { },
}:
pkgs.writeShellApplication {
  name = "center-mouse";
  runtimeInputs = [ pkgs.xdotool ];
  text = builtins.readFile ./src/center-mouse.sh;
}
# {
#   pkgs ? import <nixpkgs> { },
# }:
#
# pkgs.stdenv.mkDerivation {
#   pname = "center-mouse";
#   version = "1.0";
#   src = "./src";
#   nativeBuildInputs = [ pkgs.makeWrapper ];
#   installPhase = ''
#     		mkdir -p $out/bin
#     		cp $src/center-mouse.sh $out/bin/center-mouse
#     		chmod +x $out/bin/center-mouse
#
#     		wrapProgram $out/bin/center-mouse \
#     			--prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.xdotool ]}
#     	'';
# }
