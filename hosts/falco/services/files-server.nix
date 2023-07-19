let
  files = {
    forceSSL = true;
    enableACME = true;
    locations."/".root = "/srv/files";
  };
in
{
  services.nginx.virtualHosts = {
    "files.joka00.dev" = files;
    "f.joka00.dev" = files;
  };
}
