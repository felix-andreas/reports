{
  description = "A pandoc-based cli tool to create scientific reports";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    naersk = {
      url = "github:nix-community/naersk/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, naersk }:
    flake-utils.lib.eachDefaultSystem (
      system: with nixpkgs.legacyPackages.${system};
      let env = [
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
          default = self.packages."${system}".reports-rs;
          reports-rs = naersk-lib.buildPackage {
            pname = "reports-rs";
            root = ./.;
            nativeBuildInputs = with pkgs; [ makeWrapper ];
            overrideMain = _: {
              postInstall = ''
                wrapProgram $out/bin/reports-rs \
                  --prefix PATH : ${lib.makeBinPath env}
                ln -s $out/bin/reports-rs $out/bin/,
              '';
            };
          };
        };
      }
    );
}

