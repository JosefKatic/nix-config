{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./steam.nix
    ./prism-launcher.nix
  ];
  home = {
    packages = with pkgs; [ gamescope ];
    persistence = {
      "/persist/home/joka" = {
        allowOther = true;
        directories = [{
          # Use symlink, as games may be IO-heavy
          directory = "Games";
          method = "symlink";
        }];
      };
    };
  };
}
