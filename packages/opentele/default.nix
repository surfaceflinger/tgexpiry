{ pkgs, ... }:
pkgs.python313Packages.buildPythonPackage rec {
  pname = "opentele";
  version = "1.15.1-unstable-2024-07-15";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "thedemons";
    repo = "opentele";
    rev = "1a6f0816eac47ff3cb907af72ed9f8cbbbe8fba0";
    hash = "sha256-uvwyrT0nu+86QISpJUlO2hNBxoJxrxklu6PCHZ2tAL8=";
  };

  patches = [
    ./313.patch
    ./pyqt6.patch
  ];

  build-system = [ pkgs.python313Packages.setuptools ];

  dependencies = with pkgs.python313Packages; [
    pyqt6
    telethon
    tgcrypto
  ];

  meta = {
    homepage = "https://github.com/thedemons/opentele";
    description = "A Python Telegram API Library for converting between tdata and telethon sessions";
    license = pkgs.lib.licenses.mit;
  };
}
