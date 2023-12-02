{ inputs, ... }:

{
  stable = final: _prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };

  additions = final: prev: import ../pkgs { pkgs = final; };
}
