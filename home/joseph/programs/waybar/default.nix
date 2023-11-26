{ config, pkgs, inputs, ... }:

let
  hexToIntStr = h:
    builtins.toString (builtins.fromTOML "a=0x${h}").a;
  hsToRGBA = h: a:
    "rgba(${hexToIntStr (builtins.substring 0 2 h)}, ${hexToIntStr (builtins.substring 2 2 h)}, ${hexToIntStr (builtins.substring 4 2 h)}, ${a})";
in
{
  programs.waybar = {
    enable = true;
    settings = {
      main-bar = {
        layer = "top";
        position = "right";
        width = 20;
        padding = 0;
        margin-top = 4;
        margin-bottom = 4;
        margin-left = 0;
        margin-right = 4;
        output = [
          "DVI-D-1"
          "VGA-1"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ ];
        modules-right = [ "battery" "wireplumber" "network" "memory" "cpu" "tray" "clock" ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "";
            "11" = "";
          };
        };
        "hyprland/submap" = {
          rotate = 270;
          max-length = 30;
        };
        "clock" = {
          interval = 1;
          format = "{:%H\n%M}";
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
          interval = 2;
          format = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0E}'>MEM</span>\n{percentage}%";
          states = {
            state_inc_0 = 0;
            state_inc_25 = 25;
            state_inc_50 = 50;
            state_inc_75 = 75;
          };
        };
        "cpu" = {
          interval = 2;
          format = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0F}'>CPU</span>\n{usage}%";
          states = {
            state_inc_0 = 0;
            state_inc_25 = 25;
            state_inc_50 = 50;
            state_inc_75 = 75;
          };
        };
        "wireplumber" = {
          format = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0C}'>VOL</span>\n{volume}%";
          format-muted = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0C}'>VOL</span>\n";
        };
        "network" = {
          interval = 5;
          format-wifi = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0D}'>NET</span>\n";
          format-ethernet = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0D}'>NET</span>\n";
          format-disconnected = "<span font_size='small' font_weight='400' color='#${config.colorScheme.colors.base0D}'>NET</span>\n<small> </small>";
          tooltip-format-wifi = "{ifname} {essid} {ipaddr} {bandwidthDownBytes}";
          tooltip-format-ethernet = "{ifname} {ipaddr} {bandwidthDownBytes}";
        };
        "battery" = {
          format = "<span font_size='small'>{icon}</span>\n{capacity}%";
          format-icons = ["" "" "" "" ""];
          states = {
            battery_critical = 25;
            battery_warning = 50;
            battery_ok = 100;
          };
        };
      };
    };
    style = ''
      * {
        font-family: Iosevka;
        font-weight: 900;
        font-size: 14px;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces, #submap, #clock, #network, #wireplumber {
        background: ${hsToRGBA config.colorScheme.colors.base00 "0.9"};
        color: #${config.colorScheme.colors.base05};
        border-radius: 8px;
        margin-top: 6px;
      }

      #memory, #cpu, #battery {
        background: ${hsToRGBA config.colorScheme.colors.base00 "0.9"};
        border-radius: 8px;
        margin-top: 6px;
      }

      #submap, #clock, #memory, #cpu, #network, #wireplumber, #battery {
        padding-top: 6px;
        padding-bottom: 6px;
      }

      #workspaces {
        margin-top: 0;
      }

      #workspaces button {
        color: #${config.colorScheme.colors.base05};
      }

      #workspaces button:hover {
        background: inherit;
        transition: 0.5s;
      }

      #workspaces button.active {
        color: #${config.colorScheme.colors.base0D};
      }

      #submap {
        color: #${config.colorScheme.colors.base0F};
        font-size: 10px;
      }

      #clock {
        font-size: 18px;
      }

      .state_inc_0 {
        color: #${config.colorScheme.colors.base05};
      }

      .state_inc_25 {
        color: #${config.colorScheme.colors.base0A};
      }

      .state_inc_50 {
        color: #${config.colorScheme.colors.base09};
      }

      .state_inc_75 {
        color: #${config.colorScheme.colors.base08};
      }

      .battery_critical {
        color: #${config.colorScheme.colors.base08};
      }

      .battery_warning {
        color: #${config.colorScheme.colors.base09};
      }

      .battery_ok {
        color: #${config.colorScheme.colors.base05};
      }
    '';
  };
}
