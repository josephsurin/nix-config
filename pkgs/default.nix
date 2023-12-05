{ pkgs ? import <nixpkgs> { } }:

rec {
  flatter = pkgs.callPackage ./flatter { };
  seccomp-tools = pkgs.callPackage ./seccomp-tools { };
  bata24-gef = pkgs.callPackage ./bata24-gef { inherit seccomp-tools; };
}
