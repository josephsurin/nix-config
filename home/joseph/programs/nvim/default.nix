{ config, pkgs, inputs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    coc = {
      enable = true;
    };
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes
      base16-vim
      gruvbox
      nerdtree
      vim-easymotion
      vim-commentary
      auto-pairs
      vim-surround
      vim-multiple-cursors
      markdown-preview-nvim
      vim-markdown-toc
      python-syntax
      vimtex
      vim-polyglot
      vim-nix
      coc-solargraph
      vim-ruby
      aw-watcher-vim
    ];
    extraConfig = builtins.readFile ./.vimrc;
  };
}
