{ pkgs
, ...
}: {
  services = {
    devmon.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    gvfs.enable = true;
    tailscale.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    gnome.gnome-keyring.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    logind = {
      extraConfig = "HandlePowerKey=ignore\n HandlePowerKeyLongPress=ignore";
    };
  };
  hardware.bluetooth.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
}
