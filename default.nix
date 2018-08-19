{ mkDerivation, aeson, apply-refact, base, beam-core, beam-postgres
, beam-sqlite, brittany, cabal-install, hlint, hsimport, lens, mtl
, sqlite-simple, stdenv, text, time
}:
mkDerivation {
  pname = "nix-haskell-dev-env";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base beam-core beam-postgres beam-sqlite lens mtl
    sqlite-simple text time
  ];
  executableToolDepends = [
    apply-refact brittany cabal-install hlint hsimport
  ];
  license = stdenv.lib.licenses.bsd3;
}
