{ inputs, modulesPath, lib, ... }:
{
  imports = [ 
    ./global
   ] ++ 
   (lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ 
   [(modulesPath + "/virtualisation/digital-ocean-config.nix")]);
  colorscheme = inputs.nix-colors.colorSchemes.paraiso;
}