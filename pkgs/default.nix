{ pkgs ? import <nixpkgs> { } }:

{
  flatter = pkgs.callPackage ./flatter { };
}
