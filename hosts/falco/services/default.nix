{
  imports = [
    ../../common/optional/nginx.nix
    ../../common/optional/mysql.nix
    ../../common/optional/postgres.nix

    ./firefly.nix
    ./files-server.nix
    ./git-remote.nix
    ./headscale.nix
    ./prometheus.nix

    ./cgit
    ./website
  ];
}
