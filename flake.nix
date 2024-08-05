{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  
  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, nix-colors, hyprland, stylix, ...}@inputs :
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable { 
        inherit system;
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
          inputs.ags.homeManagerModules.default
          stylix.homeManagerModules.stylix
          inputs.spicetify-nix.homeManagerModules.default
        ];
        inherit pkgs;
        extraSpecialArgs = {
          inherit hyprland;
          inherit inputs;
          inherit pkgs-unstable;
          inherit nix-colors;
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
