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
    stylix.url = "github:danth/stylix";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nvchad4nix = {
      url = "github:NvChad/nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nvchad-on-steroids = {  # <- here
      url = "github:MOIS3Y/nvchad-on-steroids";
      flake = false;
    };
    xremap-flake.url = "github:xremap/nix-flake";
    nvim-cpp = {
      url = "github:GildedSeraphim/NvChad-fork";
      flake = false;
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen.url = "github:MarceColl/zen-browser-flake";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    firefox-shyfox = {
      url = "github:Naezr/ShyFox";
      flake = false;
    };

    # Firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, nix-colors, hyprland, stylix, ...}@inputs :
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

        overlays = [
	  inputs.hyprpanel.overlay.${system}
        ];

      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        inherit host;
        inherit username;
        inherit inputs;
        config.allowUnfree = true;
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
