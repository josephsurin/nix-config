{ pkgs ? import <nixpkgs> { } }:

{
  aw-watcher-vim = pkgs.callPackage ./aw-watcher-vim { };
}
