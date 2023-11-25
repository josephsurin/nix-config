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

      "hm" = "~/nix-config/home/joseph/";
      "hms" = "home-manager switch --flake '/home/joseph/nix-config/#joseph'";

      "cnix" = "$EDITOR ~/nix-config/hosts/ice/default.nix";
      "rnix" = "sudo nixos-rebuild switch --flake '/home/joseph/nix-config/#ice'";
      
      "ds" = "/media/winarch-shared/tmp/";
      "ods" = "/media/arch-old-home/joseph/Downloads/shit/";
      "was" = "/media/winarch-shared/";
      "cdlc" = "/media/winarch-shared/code/";
      "cdctf" = "/media/winarch-shared/code/ctf-notes";
      "vd" = "$EDITOR /media/winarch-shared/other/diary.txt";
      "vabbs" = "$EDITOR ~/nix-config/home/joseph/programs/zsh/abbreviations.nix";

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
      "xc" = "wl-copy < ";
      "cpss" = "wl-paste -t image/png > ";
      "vfz" = "$EDITOR \"\$(fzf --reverse --inline-info)\"";
      "cfz" = "cat \"\$(fzf --reverse --inline-info)\"";
      "dpwn" = "docker run -v`pwd`:/home/pwner/pwn -it docker-pwn-image";
    };
  };
}
