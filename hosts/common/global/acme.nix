{ lib, ... }:
{
  # Enable acme for usage with nginx vhosts
  security.acme = {
    defaults.email = "josef@joka00.dev";
    acceptTerms = true;
  };

  environment.persistence = {
    "/persist" = {
      directories = [
        "/var/lib/acme"
      ];
    };
  };
}
