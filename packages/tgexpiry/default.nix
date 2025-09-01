{ pkgs, perSystem, ... }:
pkgs.python313Packages.buildPythonPackage {
  name = "tgexpiry";
  src = ./.;

  pyproject = true;
  build-system = [ pkgs.python313Packages.setuptools ];

  propagatedBuildInputs = [ perSystem.self.opentele ];

  meta.mainProgram = "tgexpiry";
}
