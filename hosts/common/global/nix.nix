{ inputs, lib, ... }:
{
  nix = {
    settings = {
      substituters = [
        "https://cache.joka00.dev"
      ];
      trusted-public-keys = [
        "cache.joka00.dev:ELw0BiKSycBVWYgv0lFW+Uqjez0Y9gnKEh7sQ/8eHvE="
      ];
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
      system-features = [ "kvm" "big-parallel" "nixos-test" ];
      flake-registry = "";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      # Delete older generations too
      options = "--delete-older-than 2d";
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
  };
}
