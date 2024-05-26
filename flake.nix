{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    # Systems supported
    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # Helper to provide system-specific attributes
    forAllSystems = f:
      nixpkgs.lib.genAttrs allSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    packages = forAllSystems ({pkgs}: {
      default = pkgs.qmk;
    });

    devShells = forAllSystems ({pkgs}: {
      default = pkgs.mkShell {
        name = "6k env";
        nativeBuildInputs = builtins.attrValues {
          inherit (pkgs) qmk hello;
        };

        shellHook = ''
          echo "test shell!"
        '';
        TEST_VAR = "applied";
      };
    });

    formatter = forAllSystems ({pkgs, ...}: pkgs.alejandra);
  };
}
