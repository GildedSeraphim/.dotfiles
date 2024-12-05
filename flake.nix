{
  description = "System Flake";

  inputs = {
    # DeterminateSystems stuff
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*";

    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprlux.url = "github:amadejkastelic/Hyprlux";
    stylix.url = "github:danth/stylix";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    xremap-flake.url = "github:xremap/nix-flake";
    zen.url = "github:0xc000022070/zen-browser-flake";
    nixvim.url = "github:mikaelfangel/nixvim-config";
    erosanix.url = "github:emmanuelrosa/erosanix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    nix-colors,
    hyprland,
    stylix,
    erosanix,
    determinate,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    host = "nixos";
    username = "sn";
    pkgs = import nixpkgs {
      inherit system;
      inherit host;
      inherit username;
      inherit inputs;
      config.allowUnfree = true;
      config.nvidia.acceptLicense = true;

      overlays = [
      ];
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      inherit host;
      inherit username;
      inherit inputs;
      config.allowUnfree = true;
      config.nvidia.acceptLicense = true;
      overlays = [
        (final: prev: {
          alpaca = prev.alpaca.override {
            ollama = pkgs-unstable.ollama-cuda;
          };
          alpaca-cuda = final.alpaca;
        })
      ];
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          erosanix.nixosModules.protonvpn
          erosanix.nixosModules.fzf
          determinate.nixosModules.default
          ./configuration.nix
        ];
        specialArgs = {
          inherit hyprland;
          inherit inputs;
          inherit pkgs-unstable;
          inherit nix-colors;
        };
      };
    };

    homeConfigurations = {
      sn = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./spicetify.nix
          ./home.nix
          hyprland.homeManagerModules.default
          stylix.homeManagerModules.stylix
          inputs.spicetify-nix.homeManagerModules.default
          inputs.hyprlux.homeManagerModules.default
        ];
        inherit pkgs;
        extraSpecialArgs = {
          inherit system;
          inherit username;
          inherit pkgs;
          inherit hyprland;
          inherit inputs;
          inherit pkgs-unstable;
          inherit nix-colors;
          inherit outputs;
        };
      };
    };
  };
}
