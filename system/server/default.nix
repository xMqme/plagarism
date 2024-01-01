{
  config,
  inputs,
  pkgs,
  ...
}: {

  networking = {
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = ["wg0"];
    };
    firewall = {
      allowedUDPPorts = [51820];
    };
    wireguard.interfaces = {
      wg0 = {
        ips = ["10.124.0.2/20"];
        listenPort = 51820;
        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
        '';
        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
        '';
        privateKeyFile = "/root/wireguard-keys/private";
      };
    };
  };
}