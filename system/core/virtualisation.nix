{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd = {
      enable = true;
    };
  };
}
