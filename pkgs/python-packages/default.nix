{ pkgs ? import <nixpkgs> { } }:

{
  binteger = ps: ps.callPackage ./binteger { };
}
