{ config, pkgs, inputs, ... }:

{
  home.shellAliases = {
    "ls" = "eza";
    "cat" = "bat";
    "v" = "nvim";
    ":q" = "exit";
    "h" = "http";
    "p" = "python";
    "o" = "xdg-open";
    "pwninit" = "pwninit --template-path ~/.config/pwninit/template.py";
  };
}
