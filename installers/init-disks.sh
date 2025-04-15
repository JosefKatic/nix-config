#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash coreutils nix git

disko_file="$1"
disk="$2"
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko $disko_file --arg disks [\"$disk\"]