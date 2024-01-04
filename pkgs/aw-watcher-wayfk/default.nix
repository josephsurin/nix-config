{ writeShellApplication, wayidle, jq, curl }:

writeShellApplication {
  name = "aw-watcher-wayfk";
  runtimeInputs = [ wayidle jq curl ];
  text = builtins.readFile ./watcher.sh;
}
