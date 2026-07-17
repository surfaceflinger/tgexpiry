{ pkgs, perSystem, ... }:
pkgs.python314Packages.buildPythonPackage rec {
  pname = "opentele2";
  version = "1.2.1";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "DedInc";
    repo = "opentele2";
    tag = version;
    hash = "sha256-FvSpPUcn0TJhNfvYx6r9aYcOsHQZTU3wKX1ZBQH/f14=";
  };

  build-system = [ pkgs.python314Packages.hatchling ];

  pythonRelaxDeps = true;

  dependencies = with pkgs.python314Packages; [
    perSystem.self.tgcrypto-pyrofork
    selectolax
    telethon
  ];

  meta = {
    homepage = "https://github.com/DedInc/opentele2";
    description = "Python Telegram API Library for converting between tdata and telethon sessions, with built-in official Telegram APIs";
    license = pkgs.lib.licenses.mit;
  };
}
