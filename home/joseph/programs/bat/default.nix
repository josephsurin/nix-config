{ config, pkgs, inputs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      map-syntax = [
        "*.sage:Python"
      ];
    };
  };
}
