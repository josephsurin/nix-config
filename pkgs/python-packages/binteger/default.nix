{ lib
, stdenv
, fetchFromGitHub
, buildPythonPackage
, poetry-core
}:

buildPythonPackage rec {
  pname = "binteger";
  version = "0.15.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "hellman";
    repo = "binteger";
    rev = "v${version}";
    sha256 = "sha256-pRqL1vDHt2RqfdBchB+/ON7e7Qr8btVaVtPeMztGvxw=";
  };

  prePatch = ''
    substituteInPlace pyproject.toml \
    --replace "poetry>=0.12" "poetry-core" \
    --replace "poetry.masonry" "poetry.core.masonry"
  '';

  nativeBuildInputs = [ poetry-core ];

  meta = with lib; {
    description = "Binary integer representation toolkit";
    homepage = "https://github.com/hellman/binteger";
    license = licenses.mit;
    platforms = platforms.all;
    #maintainers = with maintainers; [ josephsurin ];
  };
}
