{
  services = {
    teamspeak3 = {
      enable = true;
    };
  };


  environment.persistence = {
    "/persist".directories = [
      "/var/lib/teamspeak3-server"
      "/var/log/teamspeak3-server"
    ];
  };
}