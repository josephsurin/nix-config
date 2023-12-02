{ lib
, stdenv
, fetchFromGitHub
, buildPythonPackage
, setuptools
, wheel
}:

buildPythonPackage rec {
  pname = "lbc-toolkit";
  version = "0.1.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "josephsurin";
    repo = "lattice-based-cryptanalysis";
    rev = "v${version}";
    sha256 = "sha256-zzDVmWLqeDGKBWz6YA4emaqDKmKQF6pspy1dEj8ck/s=";
  };

  prePatch = ''
    substituteInPlace pyproject.toml \
    --replace "\"sagemath-standard >= 9.8\"," ""
  '';

  nativeBuildInputs = [ setuptools wheel ];

  meta = with lib; {
    description = "A toolkit for cryptanalysis using lattices";
    homepage = "https://github.com/josephsurin/lattice-based-cryptanalysis";
    license = licenses.mit;
    platforms = platforms.all;
    #maintainers = with maintainers; [ josephsurin ];
  };
}
