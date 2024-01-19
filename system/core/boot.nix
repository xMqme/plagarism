{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs"];
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSprober = true;
    };
  };
}
