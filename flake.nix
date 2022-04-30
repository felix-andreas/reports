{
  description = "A pandoc template to create scientific reports";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system: with nixpkgs.legacyPackages.${system};
      let env = [
        gnumake
        rsync
        pandoc
        haskellPackages.pandoc-crossref
      ]; in
      {
        devShell = mkShell {
          nativeBuildInputs = [ bashInteractive ];
          buildInputs = env;
        };
        defaultTemplate.path = ./.;
        packages = {
          demo = runCommand "demo"
            {
              src = ./.;
              buildInputs = env;
            }
            ''
              name=demo make all
              cp -r dist $out
            '';
        };
      }
    );
}

