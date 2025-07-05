{ pkgs, perSystem, ... }:
pkgs.python312Packages.buildPythonPackage {
  name = "tgexpiry";
  src = ./.;

  pyproject = true;
  build-system = [ pkgs.python312Packages.setuptools ];

  propagatedBuildInputs = [ perSystem.self.opentele ];

  meta.mainProgram = "tgexpiry";
}
