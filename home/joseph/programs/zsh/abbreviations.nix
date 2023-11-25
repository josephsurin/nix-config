{ config, pkgs, inputs, ... }:

{
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = {
      "lst" = "ls --tree";
      "lsg" = "ls | grep";
      "lsth" = "eza -l --sort=new";
      "hsg" = "history | grep";
      "hst" = "history";
      "mdc" = "mkdir -p __CURSOR__ && cd \$_";
      "dus" = "du -sh";
      "cpv" = "rsync -ah --progress";
      "epoch" = "date +%s";

      "hm" = "~/.config/home-manager/";
      "hms" = "home-manager switch";

      "cnix" = "sudoedit /etc/nixos/configuration.nix";
      "rnix" = "sudo nixos-rebuild switch";
      
      "ds" = "~/ded/";

      "ga" = "git add";
      "gaa" = "git add .";
      "gcm" = "git commit -m '__CURSOR__'";
      "gp" = "git push";
      "gpl" = "git pull";
      "gst" = "git status";
      "gcl" = "git clone";

      "pi" = "python -i";
      "b64" = "base64";
      "b64d" = "base64 -d";
      "ac" = "aria2c";
      "xc" = "wl-copy";
      "cpss" = "wl-paste -t image/png > ";
    };
  };
}
