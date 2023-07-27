{ pkgs, ... } : {

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curl
    rustup
    virt-manager
    ntfs3g

        # ...

    (wine.override { wineBuild = "wine64"; })

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

    teamspeak_client
  ];
}