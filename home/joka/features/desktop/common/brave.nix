{ pkgs, lib, inputs, ... } : {
  programs.browserpass.enable = true;
  programs.brave = {
    enable = true;
  };
  
  home = {
    # sessionVariables.BROWSER = "brave";
    persistence = {
      # Not persisting is safer
      # "/persist/home/misterio".directories = [ ".mozilla/firefox" ];
    };
  };
}