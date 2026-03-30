{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        kiwi = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home/common.nix
            ./home/bash.nix
            ./home/fish.nix
            ./home/zellij.nix
            ./home/flatpak.nix
            ./home/nixvim.nix
            ./home/fonts.nix
            ./home/packages.nix
            ./home/files.nix
            ./home/scripts.nix
            ./home/services.nix
          ];
        };
      };
    };
}
