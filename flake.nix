{
  description = "System Flake";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";
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
    nixvim.url = "github:GildedSeraphim/nixvim-2";
    ags.url = "github:aylur/ags";
    sops-nix.url = "github:mic92/sops-nix";
    nur.url = "github:nix-community/NUR";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    solaar.url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
    asus-dialpad-driver.url = "github:asus-linux-drivers/asus-dialpad-driver";
    hyprland-easymotion = {
      url = "github:zakk4223/hyprland-easymotion";
      inputs.hyprland.follows = "hyprland";
    };
    mango.url = "github:DreamMaoMao/mango";
    erosanix.url = "github:emmanuelrosa/erosanix";
    winapps.url = "github:winapps-org/winapps";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nix-colors,
      hyprland,
      stylix,
      nixos-hardware,
      ...
    }@inputs:
    let
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
          inputs.nur.overlays.default
          (final: prev: {
          })
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
          inputs.nur.overlays.default
          (final: prev: {
            alpaca = prev.alpaca.override {
              ollama = pkgs-unstable.ollama-cuda;
            };
            alpaca-cuda = final.alpaca;
          })
        ];
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            #nixos-hardware.nixosModules.asus-zephyrus-ga401
            ./configuration.nix
            inputs.sops-nix.nixosModules.sops
            inputs.solaar.nixosModules.default
            inputs.asus-dialpad-driver.nixosModules.default
            inputs.mango.nixosModules.mango
            inputs.erosanix.nixosModules.onlyoffice
            {
              programs.mango.enable = true;
            }
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
            inputs.mango.hmModules.mango
            inputs.nixvim.homeManagerModule
            #inputs.nixvim.homeModules.nixvim
            #inputs.vicinae.homeManagerModules.default
            #            inputs.caelestia.homeManagerModules.default
            {
              home.packages = [
                #inputs.nixvim.packages.${pkgs.system}.default
                inputs.winapps.packages.${system}.winapps
                inputs.winapps.packages.${system}.winapps-launcher
              ];
            }
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
