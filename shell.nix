{
  pkgs ? (import <nixpkgs> {})
}:
let 
  projectDrv = (import ./release.nix { withHoogle = true; } ).project1;
  
  # finalDrv = pkgs.lib.overrideDerivation projectDrv (old: {

  # })
  finalDrv = projectDrv;
in 
  finalDrv.env