{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default
    ./gtk.nix
    ./vscode.nix
    ./packages.nix
    ./spicetify.nix
    ./starship.nix
    ./anyrun.nix
    ./git.nix
    ./zsh.nix
    ./mime.nix
    ./audio
    ./swayidle.nix
    ./waybar
    ./wlogout
    ./cliphist
    ./wlsunset
    ./swayosd
    ./udiskie
    ./wayland
  ];
  home.stateVersion = "23.11";
}
