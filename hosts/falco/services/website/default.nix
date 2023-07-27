{ inputs, pkgs, ... }:
let
  website = inputs.web.packages.${pkgs.system}.default;
  pgpKey = ../../../../home/joka/pgp.asc;
  sshKey = ../../../../home/joka/ssh.pub;
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

        "=/pgp.asc".alias = pgpKey;
        "=/pgp".alias = pgpKey;
        "=/ssh.pub".alias = sshKey;
        "=/ssh".alias = sshKey;
      };
    };
  };
}
