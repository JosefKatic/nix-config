{ pkgs, lib, config, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
      add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
    };
    userName = "Josef Katič";
    userEmail = "josef@joka00.dev";
    signing = {
      key = "AD8664AA34ACBE803A39276AB7EB703386D5E878";
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
    };
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
      commit.gpgSign = true;
    };
    lfs.enable = true;
    ignores = [ ".direnv" "result" ];
  };
}
