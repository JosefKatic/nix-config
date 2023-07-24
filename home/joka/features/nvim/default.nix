{ config, pkgs, lib, ... }:
# Let-In ----------------------------------------------------------------------------------------{{{
{
  # Neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ nvchad ];
  };
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  home.sessionVariables.EDITOR = "nvim";
}