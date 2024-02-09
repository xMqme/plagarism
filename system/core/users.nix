{
  config,
  pkgs,
  ...
}: {
  users = {
    motd = ''pls fix'';
    users.nixer = {
      isNormalUser = true;
      description = "nixer";
      extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "docker" "power" "nix"];
      packages = with pkgs; [];
      shell = pkgs.zsh;
    };
  };
}
