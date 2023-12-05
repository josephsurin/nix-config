# Largely copied from https://github.com/NixOS/nixpkgs/blob/933d7dc155096e7575d207be6fb7792bc9f34f6d/pkgs/development/tools/misc/gef/default.nix

{ lib
, stdenv
, fetchFromGitHub
, makeWrapper
, gdb
, python3
, bintools-unwrapped
, seccomp-tools
, one_gadget
, file
, ps
, git
, coreutils
}:

let
  pythonPath = with python3.pkgs; makePythonPath [
    keystone-engine
    unicorn
    capstone
    ropper
  ];

in stdenv.mkDerivation rec {
  pname = "bata24-gef";
  version = "git";

  src = fetchFromGitHub {
    owner = "bata24";
    repo = "gef";
    rev = "b383508b3558b36a0f4e3ec8ddc9a9c316800d51";
    sha256 = "sha256-223imImLG8gFCCl5vP44fqj9aIfgh/kFBo6CosQ9oP0=";
  };

  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/share/gef
    cp gef.py $out/share/gef
    makeWrapper ${gdb}/bin/gdb $out/bin/gef \
      --add-flags "-q -x $out/share/gef/gef.py" \
      --set NIX_PYTHONPATH ${pythonPath} \
      --prefix PATH : ${lib.makeBinPath [
        python3
        bintools-unwrapped # for readelf
        file
        ps
      ]}
  '';

  nativeCheckInputs = [
    gdb
    file
    ps
    git
    python3
    seccomp-tools
    one_gadget
    python3.pkgs.pytest
    python3.pkgs.pytest-xdist
    python3.pkgs.keystone-engine
    python3.pkgs.unicorn
    python3.pkgs.capstone
    python3.pkgs.ropper
    python3.pkgs.tqdm
  ];
  checkPhase = ''
    # Skip some tests that require network access.
    sed -i '/def test_cmd_shellcode_get(self):/i \ \ \ \ @unittest.skip(reason="not available in sandbox")' tests/runtests.py
    sed -i '/def test_cmd_shellcode_search(self):/i \ \ \ \ @unittest.skip(reason="not available in sandbox")' tests/runtests.py

    # Patch the path to /bin/ls.
    sed -i 's+/bin/ls+${coreutils}/bin/ls+g' tests/runtests.py

    # Run the tests.
    make test
  '';

  meta = with lib; {
    description = "A modern experience for GDB with advanced debugging features for exploit developers & reverse engineers (bata24 fork)";
    homepage = "https://github.com/bata24/gef";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
