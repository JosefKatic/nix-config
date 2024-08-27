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
    colorcheme.source = "#BC9A55";
  };
}
