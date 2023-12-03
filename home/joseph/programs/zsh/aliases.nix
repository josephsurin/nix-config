{ config, pkgs, inputs, ... }:

{
  home.shellAliases = {
    "ls" = "eza";
    "cat" = "bat";
    "v" = "nvim";
    ":q" = "exit";
    "h" = "http";
    "p" = "python";
    "o" = "mimeo";
  };
}
