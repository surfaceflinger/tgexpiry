{
  pkgs,
  ...
}:
pkgs.python312Packages.buildPythonPackage rec {
  pname = "telethon";
  version = "1.15.1-unstable-2024-07-15";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "thedemons";
    repo = "opentele";
    rev = "1a6f0816eac47ff3cb907af72ed9f8cbbbe8fba0";
    hash = "sha256-uvwyrT0nu+86QISpJUlO2hNBxoJxrxklu6PCHZ2tAL8=";
  };

  build-system = [
    pkgs.python312Packages.setuptools
  ];

  dependencies = with pkgs.python312Packages; [
    pyqt5
    telethon
    tgcrypto
  ];

  meta = {
    homepage = "https://github.com/thedemons/opentele";
    description = "A Python Telegram API Library for converting between tdata and telethon sessions";
    license = pkgs.lib.licenses.mit;
  };
}
