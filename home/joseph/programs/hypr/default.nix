{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = false;
    #enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  # temporary
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png;

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };
}
