{ pkgs, perSystem, ... }:
pkgs.python314Packages.buildPythonPackage {
  name = "tgexpiry";
  src = ./.;

  pyproject = true;
  build-system = [ pkgs.python314Packages.setuptools ];

  propagatedBuildInputs = [ perSystem.self.opentele2 ];

  meta.mainProgram = "tgexpiry";
}
