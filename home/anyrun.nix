{
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        translate
        symbols
        stdin
        randr
        dictionary
        inputs.anyrun-nixos-options.packages.${pkgs.system}.default
      ];

      width.fraction = 0.3;
      y.fraction = 0.075;
      hidePluginInfo = true;
      closeOnClick = true;
      maxEntries = 7;
    };
    extraConfigFiles."nixos-options.ron".text = let
      nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
      hm-options = inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";
      options = builtins.toJSON {
        ":nix" = [nixos-options];
        ":home" = [hm-options];
        ":nall" = [nixos-options hm-options];
      };
    in ''
      Config(
          options: ${options},
      )
    '';
    extraCss = ''
      * {
        transition: 200ms ease;
        font-family: Torus;
        font-size: 1.3rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main { background: transparent; }

      #match.activatable {
        border-radius: 16px;
        padding: .3rem .9rem;
        margin-top: .01rem;
      }
      #match.activatable:first-child { margin-top: .7rem; }ill
      #match.activatable:last-child { margin-bottom: .6rem; }

      #plugin:hover #match.activatable {
        border-radius: 10px;
        padding: .3rem;
        margin-top: .01rem;
        margin-bottom: 0;
      }

      #match:selected, #match:hover, #plugin:hover {
        background: rgba(255, 255, 255, .1);
      }

      #entry {
        background: rgba(255,255,255,.05);
        border: 1px solid rgba(255,255,255,.1);
        border-radius: 16px;
        margin: .3rem;
        padding: .3rem 1rem;
      }

      list > #plugin {
        border-radius: 16px;
        margin: 0 .3rem;
      }
      list > #plugin:first-child { margin-top: .3rem; }
      list > #plugin:last-child { margin-bottom: .3rem; }
      list > #plugin:hover { padding: .6rem; }

      box#main {
        background: rgba(31, 31, 40, .5);
        box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .1), 0 0 0 1px rgba(0, 0, 0, .5);
        border-radius: 24px;
        padding: .3rem;
      }
    '';
  };
}
