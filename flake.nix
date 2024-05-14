{
  description = "simple python environment";
  inputs = {
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    pre-commit-hooks,
    ...
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
          };
        });
  in {
    checks = forEachSupportedSystem ({
      pkgs,
      system,
    }: {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
          alejandra.settings = {
            check = true;
          };
          deadnix.enable = true;
          deadnix.settings = {
            noLambdaArg = true;
            noLambdaPatternNames = true;
          };
          statix.enable = true;
        };
      };
    });

    devShells = forEachSupportedSystem ({
      pkgs,
      system
    }: {
      default = pkgs.mkShell {
        packages = [
          (pkgs.python312.withPackages (python-pkgs: [
            python-pkgs.mkdocs-material
          ]))
        ] ++
        [
          pkgs.alejandra
          pkgs.deadnix
          pkgs.statix
        ];
      };
    });
  };
}
