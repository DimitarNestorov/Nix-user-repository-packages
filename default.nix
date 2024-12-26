{ pkgs ? import <nixpkgs> { } }:
let
	eclecticlightPkgs = pkgs.lib.recurseIntoAttrs (
		pkgs.lib.packagesFromDirectoryRecursive {
			inherit (pkgs) callPackage;
			directory = ./pkgs/eclectic-light;
		}
	);
in {
	eclecticlight = eclecticlightPkgs // {
		skint-m = eclecticlightPkgs.skint.overrideAttrs {
			pname = "skint-m";
			app = "SkintM.app"; 
		};
	};
}
