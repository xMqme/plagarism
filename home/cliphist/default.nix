{
  config,
  inputs,
  ...
}: {
  services.cliphist = {
    enable = true;
    systemdTarget = "hyprland-session.target";
  };
}
