{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ../modules/nixvim/default.nix
  ];
}
