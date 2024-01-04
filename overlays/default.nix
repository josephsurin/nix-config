{ inputs, ... }:

{
  stable = final: _prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };

  additions = final: prev: import ../pkgs { pkgs = final; } // {
    python3Packages = prev.python3Packages // import ../pkgs/python-packages { pkgs = final; };
    vimPlugins = prev.vimPlugins // import ../pkgs/vim-plugins { pkgs = final; };
  };
}
