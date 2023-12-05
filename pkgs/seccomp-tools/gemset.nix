{
  os = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gwd20smyhxbm687vdikfh1gpi96h8qb1x28s2pdcysf6dm6v0ap";
      type = "gem";
    };
    version = "1.1.4";
  };
  seccomp-tools = {
    dependencies = ["os"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jblbclnv85gwhmw744kd60bxi16b9si3mkmfg453az0wfiqbb6q";
      type = "gem";
    };
    version = "1.6.0";
  };
}
