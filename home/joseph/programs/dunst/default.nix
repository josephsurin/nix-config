{ config, pkgs, inputs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        corner_radius = 8;
        monitor = 0;
        follow = "mouse";
        width = 0;
        height = 1000;
        origin = "bottom-right";
        offset = "30x30";
        indicate_hidden = "yes";
        shrink = "yes";
        transparency = 10;
        notification_height = 0;
        separator_height = 1;
        padding = 16;
        horizontal_padding = 16;
        frame_width = 1;
        frame_color = "#676b6d";
        separator_color = "#575b5d";
        sort = "yes";
        idle_threshold = 120;
        font = "Noto Sans 12";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "no";
        icon_position = "left";
        max_icon_size = 72;
        sticky_history = "yes";
        history_length = 2147000000;
        browser = "firefox -new-tab";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        startup_notification = false;
        force_xinerama = false;
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#202126";
        foreground = "#888888";
        timeout = 10;
      };
      urgency_normal = {
        background = "#202126";
        foreground = "#ffffff";
        timeout = 6;
      };
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };
}
