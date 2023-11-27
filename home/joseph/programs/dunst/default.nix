{ config, pkgs, inputs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        corner_radius = 6;
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
        separator_height = 2;
        padding = 16;
        horizontal_padding = 16;
        frame_width = 2;
        # gaps = true;
        # gap_size = 8;
        frame_color = "#${config.colorScheme.colors.base03}";
        separator_color = "#${config.colorScheme.colors.base01}";
        sort = "yes";
        idle_threshold = 120;
        font = "Fira Sans 12";
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
        background = "#${config.colorScheme.colors.base00}e0";
        foreground = "#${config.colorScheme.colors.base05}";
        timeout = 10;
      };
      urgency_normal = {
        background = "#${config.colorScheme.colors.base00}e0";
        foreground = "#${config.colorScheme.colors.base05}";
        timeout = 6;
      };
      urgency_critical = {
        background = "#${config.colorScheme.colors.base00}e0";
        foreground = "#${config.colorScheme.colors.base05}";
        frame_color = "#${config.colorScheme.colors.base08}";
        timeout = 0;
      };
    };
  };
}
