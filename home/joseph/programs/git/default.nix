{ config, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "joseph.surin@gmail.com";
    userName = "joseph";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
