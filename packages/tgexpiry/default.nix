{ pkgs, perSystem, ... }:
pkgs.python312Packages.buildPythonPackage {
  name = "tgexpiry";
  src = ./.;

  propagatedBuildInputs = [ perSystem.self.opentele ];

  meta.mainProgram = "tgexpiry";
}
