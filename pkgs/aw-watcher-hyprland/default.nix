{ writeShellApplication, hyprland, jq, curl }:

writeShellApplication {
  name = "aw-watcher-hyprland";
  runtimeInputs = [ hyprland jq curl ];
  text = builtins.readFile ./watcher.sh;
}
