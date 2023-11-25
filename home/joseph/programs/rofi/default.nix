{ config, pkgs, inputs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./blurry.rasi;
  };
}
