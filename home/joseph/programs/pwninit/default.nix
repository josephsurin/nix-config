{ config, pkgs, inputs, ... }:

{
  home.file.".config/pwninit/template.py".source = ./template.py;
}
