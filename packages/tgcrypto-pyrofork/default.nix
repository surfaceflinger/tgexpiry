{ pkgs, ... }:

pkgs.python313Packages.buildPythonPackage rec {
  pname = "tgcrypto-pyrofork";
  version = "1.2.8";

  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Mayuri-Chan";
    repo = "tgcrypto-pyrofork";
    tag = "v${version}";
    hash = "sha256-52uiszwKob0DZ9f3R7oqOsusvQq+bOAIAc/4A0J5ht8=";
  };

  nativeBuildInputs = [ pkgs.python313Packages.setuptools ];

  nativeCheckInputs = [ pkgs.python313Packages.pytestCheckHook ];

  pythonImportsCheck = [ "tgcrypto" ];

  meta = {
    description = "Fast and Portable Telegram Crypto Library for Python";
    homepage = "https://github.com/Mayuri-Chan/tgcrypto-pyrofork";
    license = pkgs.lib.licenses.lgpl3Plus;
  };
}
