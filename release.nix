{ compiler ? "default" 
, withHoogle ? false
}:
let
  bootstrap = import <nixpkgs> { };

  nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs.json);

  src = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo  = "nixpkgs-channels";
    inherit (nixpkgs) rev sha256;
  };

  pinnedPkgs = import src { };

  customHaskellPackages = pinnedPkgs.haskellPackages.override (old: {
    overrides = pinnedPkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      project1 = self.callPackage ./default.nix { }; 
    });
  });

  hoogleAugmentedPackages = import ./toggle-hoogle.nix { withHoogle = withHoogle; input = customHaskellPackages; };
  # hoogleAugmentedPackages = (if withHoogle
  #   then  customHaskellPackages.override (old: {
  #           overrides = bootstrap.pkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
  #             ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
  #             ghcWithPackages = self.ghc.withPackages;
  #           });
  #         })
  #   else  customHaskellPackages);
  
  finalHaskellPackages = hoogleAugmentedPackages;
in
  { 
    project1 = finalHaskellPackages.project1;
    # project1 = pinnedPkgs.callPackage ./default.nix  {};
  }