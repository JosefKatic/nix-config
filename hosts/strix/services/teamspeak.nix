{
  services = {
    teamspeak3 = {
      enable = false;
    };
  };


  environment.persistence = {
    "/persist".directories = [
      "/var/lib/teamspeak3-server"
      "/var/log/teamspeak3-server"
    ];
  };
}