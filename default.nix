{ pkgs ? import <nixpkgs> { } }:

{
	eclecticlight = pkgs.lib.recurseIntoAttrs (
		pkgs.lib.packagesFromDirectoryRecursive {
			inherit (pkgs) callPackage;
			directory = ./pkgs/eclectic-light;
		}
	);
}
