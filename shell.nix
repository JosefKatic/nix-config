{
  perSystem = {
    config,
    pkgs,
    inputs',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs;
        [
          nix
          git
          alejandra
          nodePackages.prettier
          sops
          ssh-to-age
          gnupg
          age
        ]
        ++ [
          inputs'.hm.packages.default
        ];
      name = "config";
      DIRENV_LOG_FORMAT = "";
      # shellHook = ''
      # ${config.pre-commit.installationScript}
      # '';
    };
    formatter = pkgs.alejandra;
  };
}
