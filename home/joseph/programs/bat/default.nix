{ config, pkgs, inputs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
  };
}
