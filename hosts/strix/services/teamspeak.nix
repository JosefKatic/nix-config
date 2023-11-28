{
  services = {
    teamspeak3 = {
      enable = true;
      openFirewall = true;
      queryPort = 19102;
      defaultVoicePort = 29102;
      fileTransferPort = 39102;
    };
  };


  environment.persistence = {
    "/persist".directories = [
      "/var/lib/teamspeak3-server"
      "/var/log/teamspeak3-server"
    ];
  };
}