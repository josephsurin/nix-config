{ config, pkgs, inputs, ... }:

let
  ss_wrap = ss_type:
    "fn=$SCREENSHOT_DIR/`date +\"%Y-%m/%Y-%m-%d-at-%I-%M-%S%p-${ss_type}.png\"`;" +
    "mkdir -p `dirname $fn`" +
    " && grimblast --cursor --freeze copysave ${ss_type} $fn" +
    " && [[ $(dunstify -A yes,SHOW -i $fn \"Screenshot Taken\" \"${ss_type}\") == \"yes\" ]]" +
    " && imv $fn";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      monitor = [
        "DVI-D-1,2560x1080,0x0,1"
        "VGA-1,1920x1080,2560x0,1"
      ];

      exec-once = "${./startup.sh}";

      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "us";
        follow_mouse = "1";
        touchpad.natural_scroll = "no";
        sensitivity = 0;
      };

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgba(${config.colorScheme.colors.base0D}f0)";
        "col.inactive_border" = "rgba(${config.colorScheme.colors.base04}80)";
        layout = "dwindle";
      };

      decoration = {
        blur.enabled = true;
        rounding = 4;
        drop_shadow = "no";
      };

      animations.enabled = "no";

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = false;
        orientation = "right";
      };

      gestures.workspace_swipe = "off";

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
      };

      windowrulev2 = [
        "opacity 0.98 override 0.93 override,class:(Alacritty)"
        "workspace 2,class:(discord)"
        "workspace 2,class:(org.telegram.desktop)"
        "workspace 3,class:(firefox)"
      ];

      workspace = [
        "2,monitor:VGA-1"
        "3,monitor:VGA-1"
        "1,monitor:DVI-D-1"
        "11,monitor:DVI-D-1"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod SHIFT, R, exec, hyprctl reload,"
        "$mainMod SHIFT, R, forcerendererreload,"
        "$mainMod SHIFT, SPACE, togglefloating,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, exec, alacritty -e zsh -c python"
        "$mainMod, T, togglesplit,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, TAB, workspace, previous"

        # dunst
        "CTRL, GRAVE, exec, dunstctl history-pop"
        "CTRL, SPACE, exec, dunstctl close"
        "CTRL SHIFT, SPACE, exec, dunstctl close-all"

        # grimblast
        "CTRL SHIFT, 4, exec, ${ss_wrap "area"}"
        "CTRL SHIFT, 3, exec, ${ss_wrap "active"}"
        "CTRL SHIFT, 2, exec, ${ss_wrap "output"}"
        "CTRL SHIFT, 1, exec, ${ss_wrap "screen"}"
        ", mouse:275, exec, grimblast --cursor --freeze copy area"
        ", mouse:276, exec, wlrctl keyboard type v modifiers CTRL"

        # audio
        ", F2, exec, wpctl set-mute '@DEFAULT_AUDIO_SINK@' toggle"
        ", F3, exec, wpctl set-volume '@DEFAULT_AUDIO_SINK@' 5%-"
        ", F4, exec, wpctl set-volume '@DEFAULT_AUDIO_SINK@' 5%+"

        # arrowkey navigation/movement
        "$mainMod, LEFT, movefocus, l"
        "$mainMod, RIGHT, movefocus, r"
        "$mainMod, DOWN, movefocus, d"
        "$mainMod, UP, movefocus, u"
        "$mainMod SHIFT, LEFT, movewindow, l"
        "$mainMod SHIFT, RIGHT, movewindow, r"
        "$mainMod SHIFT, DOWN, movewindow, d"
        "$mainMod SHIFT, UP, movewindow, u"

        # hjkl navigation/movement
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"

        # cross monitor navigation/movement (with , and .)
        "$mainMod, COMMA, focusmonitor, l"
        "$mainMod, PERIOD, focusmonitor, r"
        "$mainMod SHIFT, COMMA, movewindow, mon:l"
        "$mainMod SHIFT, PERIOD, movewindow, mon:r"
        "$mainMod SHIFT, M, movecurrentworkspacetomonitor, -1"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, U, workspace, 11"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT, U, movetoworkspacesilent, 11"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
      ];
    };
    extraConfig = ''
      bind = $mainMod, R, submap, resize
      submap = resize
      binde = , H, resizeactive, -50 0
      binde = , L, resizeactive, 50 0
      binde = , K, resizeactive, 0 -50
      binde = , J, resizeactive, 0 50
      binde = SHIFT, H, resizeactive, -10 0
      binde = SHIFT, L, resizeactive, 10 0
      binde = SHIFT, K, resizeactive, 0 -10
      binde = SHIFT, J, resizeactive, 0 10
      bind = , ESCAPE, submap, reset
      submap = reset

      bind = $mainMod SHIFT, S, submap, powermenu

      submap = powermenu
      binde = , D, submap, powermenu-confirm-poweroff
      submap = powermenu-confirm-poweroff
      binde = SHIFT, ENTER, exec, poweroff
      binde = , ESCAPE, submap, reset

      submap = powermenu
      binde = , L, exec, swaylock
      binde = , S, exec, systemctl suspend
      binde = , M, exec, sleep 1 && hyprctl dispatch dpms off
      binde = , N, exec, sleep 1 && hyprctl dispatch dpms on
      binde = , N, submap, reset

      bind = , ESCAPE, submap, reset
      submap = reset
    '';
  };

  programs.swaylock.enable = true;
  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload =${../../wallpapers/hue-teo-kaju-blast.jpg}
    wallpaper = ,${../../wallpapers/hue-teo-kaju-blast.jpg}
  '';
}
