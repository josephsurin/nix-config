{ vimUtils, fetchFromGitHub }:

let
  pname = "aw-watcher-vim";
in
  vimUtils.buildVimPlugin {
    inherit pname;
    dontBuild = true;
    version = "git";
    src = fetchFromGitHub {
      owner = "ActivityWatch";
      repo = "${pname}";
      rev = "4ba86d05a940574000c33f280fd7f6eccc284331";
      sha256 = "sha256-I7YYvQupeQxWr2HEpvba5n91+jYvJrcWZhQg+5rI908=";
    };
  }
