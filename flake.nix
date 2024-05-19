{
  description = "simple python environment";
  inputs = {
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    pre-commit-hooks,
    ...
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    checks = forAllSystems (system: {
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
          markdownlint.enable = true;
          markdownlint.settings = {
            configuration = {
              "MD013" = {
                "tables" = false;
              };
              "MD025" = false;
              "MD029" = {
                "style" = "one_or_ordered";
              };
              "MD041" = false;
            };
          };
          mkdocs-linkcheck = {
            enable = false;
            pass_filenames = false;
            settings = {
              path = "docs";
              local-only = true;
              recurse = true;
            };
          };
          statix.enable = true;
        };
      };
    });

    devShells = forAllSystems (system: {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
        packages =
          [
            (nixpkgs.legacyPackages.${system}.python312.withPackages (python-pkgs: [
              python-pkgs.mkdocs-material
            ]))
          ]
          ++ [
            nixpkgs.legacyPackages.${system}.alejandra
            nixpkgs.legacyPackages.${system}.deadnix
            nixpkgs.legacyPackages.${system}.markdownlint-cli
            nixpkgs.legacyPackages.${system}.mdl
            nixpkgs.legacyPackages.${system}.statix
          ];
      };
    });
  };
}
