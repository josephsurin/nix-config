{ pkgs ? import <nixpkgs> { } }:

rec {
  flatter = pkgs.callPackage ./flatter { };
  seccomp-tools = pkgs.callPackage ./seccomp-tools { };
  bata24-gef = pkgs.callPackage ./bata24-gef { inherit seccomp-tools; };
  aw-watcher-hyprland = pkgs.callPackage ./aw-watcher-hyprland { };
  aw-watcher-wayfk = pkgs.callPackage ./aw-watcher-wayfk { };
}
