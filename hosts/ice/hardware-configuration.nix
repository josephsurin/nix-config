{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/ded2f263-2ea9-4c69-92fe-dc857a1b1a85";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/5C8C-E331";
      fsType = "vfat";
    };
    "/media/arch-old-home" = {
      device = "/dev/disk/by-uuid/c1de1a8c-1a3c-489c-ac85-61d32594d702";
      fsType = "ext4";
    };
    "/media/winarch-shared" = {
      device = "/dev/disk/by-uuid/E8E0A2DFE0A2B36C";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/c9da9af4-f05a-4dc8-a869-bb3d1664d655";
    }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
