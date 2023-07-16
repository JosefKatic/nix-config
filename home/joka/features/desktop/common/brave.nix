{ pkgs, lib, inputs, ... } : {
  programs.browserpass.enable = true;
  programs.brave = {
    enable = true;
  };
  
  home = {
    sessionVariables.BROWSER = "brave";
    persistence = {
      # Not persisting is safer
      # "/persist/home/misterio".directories = [ ".mozilla/firefox" ];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "brave.desktop" ];
    "text/xml" = [ "brave.desktop" ];
    "x-scheme-handler/http" = [ "brave.desktop" ];
    "x-scheme-handler/https" = [ "brave.desktop" ];
  };
}