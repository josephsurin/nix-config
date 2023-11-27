{ config, pkgs, inputs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dimensions = {
          columns = 80;
          lines = 24;
        };

        padding = {
          x = 6;
          y = 6;
        };

        dynamic_padding = false;

        decorations = "full";
      };

      font = {
        normal.family = "Fira Code";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      selection.semantic_escape_chars = ",│`|:\"' ()[]{}<>";
      cursor.style = "Beam";

      unfocused_hollow = true;

      key_bindings = [
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "T";
          mods = "Control|Shift";
          action = "SpawnNewInstance";
        }
        {
          key = "Up";
          mods = "Control|Shift";
          action = "ScrollLineUp";
        }
        {
          key = "Down";
          mods = "Control|Shift";
          action = "ScrollLineDown";
        }
        {
          key = "K";
          mods = "Control|Shift";
          action = "ScrollLineUp";
        }
        {
          key = "J";
          mods = "Control|Shift";
          action = "ScrollLineDown";
        }
        {
          key = "PageUp";
          mods = "Control|Shift";
          action = "ScrollPageUp";
        }
        {
          key = "PageDown";
          mods = "Control|Shift";
          action = "ScrollPageDown";
        }
        {
          key = "K";
          mods = "Control|Alt";
          action = "ScrollPageUp";
        }
        {
          key = "J";
          mods = "Control|Alt";
          action = "ScrollPageDown";
        }
      ];
    };
  };
}
