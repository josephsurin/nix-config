{ config, pkgs, inputs, ... }:

{
  home.shellAliases = {
    "ls" = "exa";
    "cat" = "bat";
    "v" = "nvim";
    ":q" = "exit";
    "h" = "http";
    "p" = "python";
  };
}
