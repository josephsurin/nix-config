{ config, pkgs, inputs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      main-bar = {
        position = "top";
        height = 30;
        output = [
          "VGA-1"
          "DVI-D-1"
        ];
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "memory" "cpu" "temperature" "wireplumber" "network" "battery" "tray" ];
        "hyprland/workspaces" = {
        };
        "clock" = {
          format = " {:%A %d/%m/%Y %r}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            on-click-right = "mode";
          };
          actions = {
            on-click-right = "mode";
          };
        };
        "memory" = {
          format = " {percentage}%";
        };
        "cpu" = {
          format = " {usage}%";
        };
        "temperature" = {
          format = " {percentage}%";
        };
        "wireplumber" = {
          format = " {volume}%";
          format-muted = "";
        };
        "network" = {
          interval = 2;
          format = "{bandwidthDownBytes}";
        };
        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
        };
      };
    };
  };
}
