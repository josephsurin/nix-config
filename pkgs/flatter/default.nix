{ lib
, stdenv
, fetchFromGitHub
, cmake
, blas
, gmp
, mpfr
, fplll
, eigen
}:

stdenv.mkDerivation rec {
  pname = "flatter";
  version = "git";

  src = fetchFromGitHub {
    owner = "keeganryan";
    repo = "flatter";
    rev = "500e31df6b7308e8101b2a4a9cc816bf8f483417";
    sha256 = "sha256-STYx7cXvkcF+KqrG32pN16HWfEScc0zxkmOmfv43zIw=";
  };

  nativeBuildInputs = [ cmake blas gmp mpfr fplll eigen ];

  meta = with lib; {
    description = "A library for performing (f)ast (lat)tice (r)eduction of integer lattice bases";
    homepage = "https://github.com/keeganryan/flatter";
    license = licenses.lgpl3Only;
    platforms = platforms.all;
    #maintainers = with maintainers; [ josephsurin ];
  };
}
