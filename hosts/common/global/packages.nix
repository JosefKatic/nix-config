{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libsecret
    curl
  ];
} 
