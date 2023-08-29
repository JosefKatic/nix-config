{ modulesPath, ... }:
{
  imports = [
    ../common/optional/ephemeral-btrfs.nix
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "virtio_pci" "usbhid" ];
    };
    # Enable nested virtualization
    extraModprobeConfig = "options kvm nested=1";
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 8196;
  }];

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
