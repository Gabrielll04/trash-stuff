{
  description = "My very noob nix config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    
    home-manager = { 
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    system = "x86_64-linux";
  in {
    inherit lib;
    nixosConfigurations."main-desktop" = lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [ ./hosts/desktop ];
    };

    nixosConfigurations."college-vm" = lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [ ./hosts/vm ];
    };

    homeConfigurations = {
      "gabriel@vm" = lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [ ./home/vm ];
      };
   
      "gabriel@nixos" = lib.homeManagerConfiguration { 
        pkgs = nixpkgs.legacyPackages.${system};
	      extraSpecialArgs = { inherit inputs outputs; };
    	  modules = [ ./home/desktop ];
      };
    };
  };
}
