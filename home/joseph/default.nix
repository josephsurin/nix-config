{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs
  ];

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "joseph";
  home.homeDirectory = "/home/joseph";

  home.packages = with pkgs; [
    hello
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  home.sessionVariables = {
  };

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  programs.home-manager.enable = true;
  news.display = "silent";
}
