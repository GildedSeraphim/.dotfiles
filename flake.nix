{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    hyprlux = {
      url = "github:amadejkastelic/Hyprlux";
    };
    stylix.url = "github:danth/stylix";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    xremap-flake.url = "github:xremap/nix-flake";
    zen.url = "github:0xc000022070/zen-browser-flake";
    hyprsysteminfo = {
      url = "github:hyprwm/hyprsysteminfo";
    };
    nixvim.url = "github:mikaelfangel/nixvim-config";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    nix-colors,
    hyprland,
    stylix,
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
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
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

    devShells.x86_64-linux.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        #Python stuff
        python312Packages.pip
        #C++ Dev
        libgcc
        cmake

        #xorg stuff
        xorg.libXrandr
        xorg.libXinerama
        xorg.libXcursor
        xorg.xinput
        xorg.libXi

        #OpenGL
        libGLU
        libGL
        glfw
        glew
        freeglut
        cairo
        glm
        SDL2
        esshader
      ];
      shellHook = ''
        echo "Welcome"
               echo "To my C++ OpenGL Shell!!!" | ${pkgs.lolcat}/bin/lolcat
      '';
    };
  };
}
