{ inputs, ... }:

{
  stable = final: _prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };
}
