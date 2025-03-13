# Jak spustit a otestovat tento projekt

## VM

1. Stáhněte si [Minimal ISO image NixOS](https://nixos.org/download/#nixos-iso) ten standartně nemá nainstalovaný git, lze to změnit ale je to složitější.
2. Vytvořte VM (musí být připojena k internetu)
3. Nastavení disku, probíhá pomocí utility pro Nix - Disko. Disko nakonfiguruje systémový disk pomocí BTRFS a vytvoří potřebné subvolumes.
4. Poté je možné spustit instalaci samotného systému.
5. Restartujte zařízení
6. Měl by naběhnout systém

