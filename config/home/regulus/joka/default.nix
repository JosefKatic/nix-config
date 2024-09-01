{
  pkgs,
  inputs,
  ...
}: {
  user = {
    name = "joka";
    terminal = {
      shell.fish.enable = true;
    };
  };
  theme = rec {
    colorscheme.source = "#BC9A55";
  };
}
