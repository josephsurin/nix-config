{ config, pkgs, inputs, ... }:

{
  xdg = {
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    };
    desktopEntries = {
      imv = {
        name = "imv";
        genericName = "Image Viewer";
        exec = "imv %U";
        mimeType = [ "image/jpeg" "image/png" ];
        noDisplay = true;
      };
    };
  };
}
