{ pkgs ? import <nixpkgs> { } }:

{
  binteger = pkgs.python3Packages.callPackage ./binteger { };
  lbc-toolkit = pkgs.python3Packages.callPackage ./lbc-toolkit { };
}
