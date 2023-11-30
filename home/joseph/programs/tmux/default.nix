{ config, pkgs, inputs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    extraConfig = builtins.readFile ./.tmux.conf; # TODO: rewrite
  };
}
