{ config, pkgs, inputs, ... }:

let
  ss_wrap = ss_type:
    "[ -d $SCREENSHOT_DIR/`date +\"%Y-%m\"` ]" +
    " || mkdir $SCREENSHOT_DIR/`date +\"%Y-%m\"`" +
    " && grimblast --cursor --freeze copysave ${ss_type}" +
    " $SCREENSHOT_DIR/`date +\"%Y-%m\"`/`date +\"%Y-%m-%d-at-%I-%M-%S%p-${ss_type}.png\"`";
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

      exec-once = "hyprpaper & lxqt-policykit-agent & waybar";

      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "us";
        follow_mouse = "1";
        touchpad.natural_scroll = "no";
        sensitivity = 0;
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee)";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        blur.enabled = false;
        rounding = 0;
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

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod SHIFT, R, exec, hyprctl reload,"
        "$mainMod SHIFT, R, forcerendererreload,"
        "$mainMod SHIFT, SPACE, togglefloating,"
        "$mainMod, D, exec, rofi -show drun"
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

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"

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
    '';
  };

  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png;
}
