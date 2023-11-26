{ pkgs }:

let
  abbreviations = {
    "lst" = "ls --tree";
    "lsg" = "ls | grep";
    "lsth" = "eza -l --sort=new";
    "hsg" = "history | grep";
    "hst" = "history";
    "mdc" = "mkdir -p __CURSOR__ && cd \\\$_";
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
    "vfz" = "$EDITOR \\\"\\$(fzf --reverse --inline-info)\\\"";
    "cfz" = "cat \\\"\\$(fzf --reverse --inline-info)\\\"";
    "dpwn" = "docker run -v`pwd`:/home/pwner/pwn -it docker-pwn-image";
  };

  buildAbbrevs = attrs: builtins.concatStringsSep "\n" (builtins.attrValues (builtins.mapAttrs (k: v: "\"${k}\" \"${v}\"") attrs));

  src = ''
setopt extendedglob

typeset -A abbrevs

abbrevs=(
  ${buildAbbrevs abbreviations}
)

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

for abbr in ''${(k)abbrevs}; do
  alias $abbr="''${abbrevs[$abbr]}"
done

magic-abbrev-expand() {
  local MATCH
  LBUFFER=''${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  command=''${abbrevs[$MATCH]}
  LBUFFER+=''${command:-$MATCH}

  if [[ "''${command}" =~ "__CURSOR__" ]]; then
    RBUFFER=''${LBUFFER[(ws:__CURSOR__:)2]}
    LBUFFER=''${LBUFFER[(ws:__CURSOR__:)1]}
  else
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  magic-abbrev-expand
  zle backward-delete-char
  zle accept-line
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

bindkey ' ' magic-abbrev-expand
bindkey "^M" magic-abbrev-expand-and-execute
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
  '';
in
{
  file = pkgs.writeText "abbrevs.zsh" src;
}
