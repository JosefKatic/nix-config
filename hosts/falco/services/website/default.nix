{ inputs, pkgs, ... }:
let
  website = inputs.website.packages.${pkgs.system}.main;
  pgpKey = ../../../../home/joka/pgp.asc;
  sshKey = ../../../../home/joka/ssh.pub;
  redir = {
    forceSSL = true;
    enableACME = true;
    locations."/".return = "302 https://joka00.dev$request_uri";
  };
  days = n: toString (n * 60 * 60 * 24);
in
{
  services.nginx.virtualHosts = {
    "joka00.dev" = {
      forceSSL = true;
      enableACME = true;
      locations = {
        "/" = {
          root = "${website}/public";
        };
        "/assets/" = {
          root = "${website}/public";
          extraConfig = ''
            add_header Cache-Control "max-age=${days 30}";
          '';
        };

        "=/nix" = {
          # Script to download static nix
          alias = ./scripts/nix-installer.sh;
        };

        "=/setup-gpg" = {
          alias = ./scripts/setup-gpg.sh;
        };

        "=/pgp.asc".alias = pgpKey;
        "=/pgp".alias = pgpKey;
        "=/ssh.pub".alias = sshKey;
        "=/ssh".alias = sshKey;
      };
    };
  };
}
