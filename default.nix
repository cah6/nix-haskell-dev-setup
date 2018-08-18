{ mkDerivation, base, beam-core, stdenv }:
mkDerivation {
  pname = "nix-haskell-dev-env";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base beam-core ];
  license = stdenv.lib.licenses.bsd3;
}
