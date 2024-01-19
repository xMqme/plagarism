{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.videoDrivers = ["modesetting" " amdgpu"];
  boot = {
    initrd.kernelModules = ["amdgpu"];
    kernelModules = ["amdgpu"];
  };
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        mesa
        vaapiVdpau
        libvdpau-va-gl
        vulkan-validation-layers
        rocmPackages.clr.icd
      ];
    };
  };
}
