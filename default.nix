{ mkDerivation, aeson, base, hlint, mtl, stdenv, text, time }:
mkDerivation {
  pname = "nix-haskell-dev-env";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ aeson base mtl text time ];
  executableToolDepends = [ hlint ];
  license = stdenv.lib.licenses.bsd3;
}
