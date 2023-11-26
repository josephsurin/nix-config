{ config, pkgs, inputs, ... }:

let
  nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
  nix-colors = inputs.nix-colors;
  abbrevs = import ./abbreviations.nix { pkgs = pkgs; };
in
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = false;
    syntaxHighlighting = {
      enable = true;
    };
    defaultKeymap = "emacs";
    autocd = true;
    history = {
      extended = true;
      save = 100000000;
      size = 100000000;
    };
    historySubstringSearch.enable = true;
    initExtra = ''
      ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
      sh ${nix-colors-lib.shellThemeFromScheme { scheme = config.colorScheme; }}
      source ~/.p10k.zsh
      autoload edit-command-line; zle -N edit-command-line
      bindkey -M vicmd v edit-command-line
      zstyle ':completion:*' menu select
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
    '';
    envExtra = ''
      source ${abbrevs.file}
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "npm" "copyfile" "extract" "python" ];
    };
  };

  home.file.".p10k.zsh".source = ./.p10k.zsh;
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.alacritty.enable = true;
}
